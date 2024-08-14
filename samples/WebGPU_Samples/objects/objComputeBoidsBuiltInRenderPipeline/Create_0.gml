// Source: https://webgpu.github.io/webgpu-samples/?sample=computeBoids

var updateSpritesWGSL = @"
  struct Particle {
    pos : vec2f,
    vel : vec2f,
  }
  struct SimParams {
    deltaT : f32,
    rule1Distance : f32,
    rule2Distance : f32,
    rule3Distance : f32,
    rule1Scale : f32,
    rule2Scale : f32,
    rule3Scale : f32,
  }
  struct Particles {
    particles : array<Particle>,
  }
  @binding(0) @group(0) var<uniform> params : SimParams;
  @binding(1) @group(0) var<storage, read> particlesA : Particles;
  @binding(2) @group(0) var<storage, read_write> particlesB : Particles;

  // https://github.com/austinEng/Project6-Vulkan-Flocking/blob/master/data/shaders/computeparticles/particle.comp
  @compute @workgroup_size(64)
  fn main(@builtin(global_invocation_id) GlobalInvocationID : vec3u) {
    var index = GlobalInvocationID.x;

    var vPos = particlesA.particles[index].pos;
    var vVel = particlesA.particles[index].vel;
    var cMass = vec2(0.0);
    var cVel = vec2(0.0);
    var colVel = vec2(0.0);
    var cMassCount = 0u;
    var cVelCount = 0u;
    var pos : vec2f;
    var vel : vec2f;

    for (var i = 0u; i < arrayLength(&particlesA.particles); i++) {
      if (i == index) {
        continue;
      }

      pos = particlesA.particles[i].pos.xy;
      vel = particlesA.particles[i].vel.xy;
      if (distance(pos, vPos) < params.rule1Distance) {
        cMass += pos;
        cMassCount++;
      }
      if (distance(pos, vPos) < params.rule2Distance) {
        colVel -= pos - vPos;
      }
      if (distance(pos, vPos) < params.rule3Distance) {
        cVel += vel;
        cVelCount++;
      }
    }
    if (cMassCount > 0) {
      cMass = (cMass / vec2(f32(cMassCount))) - vPos;
    }
    if (cVelCount > 0) {
      cVel /= f32(cVelCount);
    }
    vVel += (cMass * params.rule1Scale) + (colVel * params.rule2Scale) + (cVel * params.rule3Scale);

    // clamp velocity for a more pleasing simulation
    vVel = normalize(vVel) * clamp(length(vVel), 0.0, 0.1);
    // kinematic update
    vPos = vPos + (vVel * params.deltaT);
    // Wrap around boundary
    if (vPos.x < -1.0) {
      vPos.x = 1.0;
    }
    if (vPos.x > 1.0) {
      vPos.x = -1.0;
    }
    if (vPos.y < -1.0) {
      vPos.y = 1.0;
    }
    if (vPos.y > 1.0) {
      vPos.y = -1.0;
    }
    // Write back
    particlesB.particles[index].pos = vPos;
    particlesB.particles[index].vel = vVel;
  }
";

var adapter = GPU.requestAdapter();
device = adapter.requestDevice();

computePipeline = device.createComputePipeline({
  layout: "auto",
  compute: {
    module: device.createShaderModule({
      code: updateSpritesWGSL,
    }),
  },
});

numParticles = 1500;

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_custom(vertex_type_float1, vertex_usage_texcoord);
vertexFormat = vertex_format_end();

vertexBuffer = vertex_create_buffer();
vertex_begin(vertexBuffer, vertexFormat);
for (var i = 0; i < numParticles; ++i) {
  vertex_position(vertexBuffer, -0.01, -0.02);
  vertex_float1(vertexBuffer, i);
  vertex_position(vertexBuffer, 0.01, -0.02);
  vertex_float1(vertexBuffer, i);
  vertex_position(vertexBuffer, 0.0, 0.02);
  vertex_float1(vertexBuffer, i);
}
vertex_end(vertexBuffer);
vertex_freeze(vertexBuffer);

simParams = {
  deltaT: 0.04,
  rule1Distance: 0.1,
  rule2Distance: 0.025,
  rule3Distance: 0.025,
  rule1Scale: 0.02,
  rule2Scale: 0.05,
  rule3Scale: 0.005,
};

simParamBufferSize = 7 * 4;
simParamBuffer = device.createBuffer({
  label: "paramsBuffer",
  size: simParamBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
});

function updateSimParams() {
  device.queue.writeBuffer(
    simParamBuffer,
    0,
    [
      simParams.deltaT,
      simParams.rule1Distance,
      simParams.rule2Distance,
      simParams.rule3Distance,
      simParams.rule1Scale,
      simParams.rule2Scale,
      simParams.rule3Scale,
    ]
  );
}

updateSimParams();

initialParticleData = array_create(numParticles * 4);
for (var i = 0; i < numParticles; ++i) {
  initialParticleData[4 * i + 0] = 2 * (random(1) - 0.5);
  initialParticleData[4 * i + 1] = 2 * (random(1) - 0.5);
  initialParticleData[4 * i + 2] = 2 * (random(1) - 0.5) * 0.1;
  initialParticleData[4 * i + 3] = 2 * (random(1) - 0.5) * 0.1;
}

particleBuffers = array_create(2);
particleBindGroups = array_create(2);
for (var i = 0; i < 2; ++i) {
  particleBuffers[i] = device.createBuffer({
    label: $"particleBuffer{i}",
    size: 4 * array_length(initialParticleData),
    usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
    mappedAtCreation: true,
  });
  particleBuffers[i].getMappedRange().set(
    initialParticleData
  );
  particleBuffers[i].unmap();
}

for (var i = 0; i < 2; ++i) {
  particleBindGroups[i] = device.createBindGroup({
    layout: computePipeline.getBindGroupLayout(0),
    entries: [
      {
        binding: 0,
        resource: {
          buffer: simParamBuffer,
        },
      },
      {
        binding: 1,
        resource: {
          buffer: particleBuffers[i],
          offset: 0,
          size: 4 * array_length(initialParticleData),
        },
      },
      {
        binding: 2,
        resource: {
          buffer: particleBuffers[(i + 1) % 2],
          offset: 0,
          size: 4 * array_length(initialParticleData),
        },
      },
    ],
  });
}

t = 0;

// Since the STORAGE usage cannot be mixed with MAP_READ, we need to make a
// separate buffer which we can copy the data into and then map for reading on
// the CPU side
mapBuffer = device.createBuffer({
  label: "mapBuffer",
  size: 4 * array_length(initialParticleData),
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});

// We will copy data from mapBuffer into this and then send it to our shader to
// draw boids
uniformBuffer = buffer_create(4 * array_length(initialParticleData), buffer_fixed, 1);

destroyed = false;
