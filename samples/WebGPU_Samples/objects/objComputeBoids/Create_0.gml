var spriteWGSL = @"
  struct VertexOutput {
    @builtin(position) position : vec4f,
    @location(4) color : vec4f,
  }

  @vertex
  fn vert_main(
    @location(0) a_particlePos : vec2f,
    @location(1) a_particleVel : vec2f,
    @location(2) a_pos : vec2f
  ) -> VertexOutput {
    let angle = -atan2(a_particleVel.x, a_particleVel.y);
    let pos = vec2(
      (a_pos.x * cos(angle)) - (a_pos.y * sin(angle)),
      (a_pos.x * sin(angle)) + (a_pos.y * cos(angle))
    );
  
    var output : VertexOutput;
    output.position = vec4(pos + a_particlePos, 0.0, 1.0);
    output.color = vec4(
      1.0 - sin(angle + 1.0) - a_particleVel.y,
      pos.x * 100.0 - a_particleVel.y + 0.1,
      a_particleVel.x + cos(angle + 0.5),
      1.0);
    return output;
  }

  @fragment
  fn frag_main(@location(4) color : vec4f) -> @location(0) vec4f {
    return color;
  }
";

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

adapter = GPU.requestAdapter();
device = adapter.requestDevice();
var presentationFormat = GPU.getPreferredCanvasFormat();

spriteShaderModule = device.createShaderModule({ code: spriteWGSL });
renderPipeline = device.createRenderPipeline({
  layout: "auto",
  vertex: {
    module: spriteShaderModule,
    buffers: [
      {
        // instanced particles buffer
        arrayStride: 4 * 4,
        stepMode: "instance",
        attributes: [
          {
            // instance position
            shaderLocation: 0,
            offset: 0,
            format: "float32x2",
          },
          {
            // instance velocity
            shaderLocation: 1,
            offset: 2 * 4,
            format: "float32x2",
          },
        ],
      },
      {
        // vertex buffer
        arrayStride: 2 * 4,
        stepMode: "vertex",
        attributes: [
          {
            // vertex positions
            shaderLocation: 2,
            offset: 0,
            format: "float32x2",
          },
        ],
      },
    ],
  },
  fragment: {
    module: spriteShaderModule,
    targets: [
      {
        format: presentationFormat,
      },
    ],
  },
  primitive: {
    topology: "triangle-list",
  },
});

computePipeline = device.createComputePipeline({
  layout: "auto",
  compute: {
    module: device.createShaderModule({
      code: updateSpritesWGSL,
    }),
  },
});

renderPassDescriptor = {
  colorAttachments: [
    {
      view: undefined, // Assigned later
      clearValue: [0, 0, 0, 1],
      loadOp: "clear",
      storeOp: "store",
    },
  ],
};

computePassDescriptor = {};

vertexBufferData = [
  -0.01, -0.02, 0.01,
  -0.02, 0.0, 0.02,
];

spriteVertexBuffer = device.createBuffer({
  size: 4 * array_length(vertexBufferData),
  usage: GPUBufferUsage.VERTEX,
  mappedAtCreation: true,
});
spriteVertexBuffer.getMappedRange().set(vertexBufferData);
spriteVertexBuffer.unmap();

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

numParticles = 1500;
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
    size: 4 * array_length(initialParticleData),
    usage: GPUBufferUsage.VERTEX | GPUBufferUsage.STORAGE,
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

frame = function () {
  renderPassDescriptor.colorAttachments[0].view = GPU.getCurrentTextureView();

  commandEncoder = device.createCommandEncoder();
  {
    passEncoder = commandEncoder.beginComputePass(computePassDescriptor);
    passEncoder.setPipeline(computePipeline);
    passEncoder.setBindGroup(0, particleBindGroups[t % 2]);
    passEncoder.dispatchWorkgroups(ceil(numParticles / 64));
    passEncoder.end_();
  }
  {
    passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
    passEncoder.setPipeline(renderPipeline);
    passEncoder.setVertexBuffer(0, particleBuffers[(t + 1) % 2]);
    passEncoder.setVertexBuffer(1, spriteVertexBuffer);
    passEncoder.draw(3, numParticles, 0, 0);
    passEncoder.end_();
  }

  device.queue.submit([commandEncoder.finish()]);

  ++t;
};
