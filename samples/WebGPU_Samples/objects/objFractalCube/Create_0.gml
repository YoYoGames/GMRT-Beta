// Source: https://webgpu.github.io/webgpu-samples/?sample=fractalCube

var basicVertWGSL = @"
  struct Uniforms {
    modelViewProjectionMatrix : mat4x4f,
  }
  @binding(0) @group(0) var<uniform> uniforms : Uniforms;
  
  struct VertexOutput {
    @builtin(position) Position : vec4f,
    @location(0) fragUV : vec2f,
    @location(1) fragPosition: vec4f,
  }
  
  @vertex
  fn main(
    @location(0) position : vec4f,
    @location(1) uv : vec2f
  ) -> VertexOutput {
    var output : VertexOutput;
    output.Position = uniforms.modelViewProjectionMatrix * position;
    output.fragUV = uv;
    output.fragPosition = 0.5 * (position + vec4(1.0, 1.0, 1.0, 1.0));
    return output;
  }
";

var sampleSelfWGSL = @"
  @binding(1) @group(0) var mySampler: sampler;
  @binding(2) @group(0) var myTexture: texture_2d<f32>;

  @fragment
  fn main(
    @location(0) fragUV: vec2f,
    @location(1) fragPosition: vec4f
  ) -> @location(0) vec4f {
    let texColor = textureSample(myTexture, mySampler, fragUV * 0.8 + vec2(0.1));
    let f = select(1.0, 0.0, length(texColor.rgb - vec3(0.5)) < 0.01);
    return f * texColor + (1.0 - f) * fragPosition;
  }
";

cubeVertexSize = 4 * 10; // Byte size of one cube vertex.
cubePositionOffset = 0;
cubeColorOffset = 4 * 4; // Byte offset of cube vertex color attribute.
cubeUVOffset = 4 * 8;
cubeVertexCount = 36;

cubeVertexArray = [
  // float4 position, float4 color, float2 uv,
  1, -1, 1, 1,   1, 0, 1, 1,  0, 1,
  -1, -1, 1, 1,  0, 0, 1, 1,  1, 1,
  -1, -1, -1, 1, 0, 0, 0, 1,  1, 0,
  1, -1, -1, 1,  1, 0, 0, 1,  0, 0,
  1, -1, 1, 1,   1, 0, 1, 1,  0, 1,
  -1, -1, -1, 1, 0, 0, 0, 1,  1, 0,

  1, 1, 1, 1,    1, 1, 1, 1,  0, 1,
  1, -1, 1, 1,   1, 0, 1, 1,  1, 1,
  1, -1, -1, 1,  1, 0, 0, 1,  1, 0,
  1, 1, -1, 1,   1, 1, 0, 1,  0, 0,
  1, 1, 1, 1,    1, 1, 1, 1,  0, 1,
  1, -1, -1, 1,  1, 0, 0, 1,  1, 0,

  -1, 1, 1, 1,   0, 1, 1, 1,  0, 1,
  1, 1, 1, 1,    1, 1, 1, 1,  1, 1,
  1, 1, -1, 1,   1, 1, 0, 1,  1, 0,
  -1, 1, -1, 1,  0, 1, 0, 1,  0, 0,
  -1, 1, 1, 1,   0, 1, 1, 1,  0, 1,
  1, 1, -1, 1,   1, 1, 0, 1,  1, 0,

  -1, -1, 1, 1,  0, 0, 1, 1,  0, 1,
  -1, 1, 1, 1,   0, 1, 1, 1,  1, 1,
  -1, 1, -1, 1,  0, 1, 0, 1,  1, 0,
  -1, -1, -1, 1, 0, 0, 0, 1,  0, 0,
  -1, -1, 1, 1,  0, 0, 1, 1,  0, 1,
  -1, 1, -1, 1,  0, 1, 0, 1,  1, 0,

  1, 1, 1, 1,    1, 1, 1, 1,  0, 1,
  -1, 1, 1, 1,   0, 1, 1, 1,  1, 1,
  -1, -1, 1, 1,  0, 0, 1, 1,  1, 0,
  -1, -1, 1, 1,  0, 0, 1, 1,  1, 0,
  1, -1, 1, 1,   1, 0, 1, 1,  0, 0,
  1, 1, 1, 1,    1, 1, 1, 1,  0, 1,

  1, -1, -1, 1,  1, 0, 0, 1,  0, 1,
  -1, -1, -1, 1, 0, 0, 0, 1,  1, 1,
  -1, 1, -1, 1,  0, 1, 0, 1,  1, 0,
  1, 1, -1, 1,   1, 1, 0, 1,  0, 0,
  1, -1, -1, 1,  1, 0, 0, 1,  0, 1,
  -1, 1, -1, 1,  0, 1, 0, 1,  1, 0,
];

adapter = GPU.requestAdapter();
device = adapter.requestDevice();
var presentationFormat = GPU.getPreferredCanvasFormat();

verticesBuffer = device.createBuffer({
  size: array_length(cubeVertexArray) * 4, // 4 bytes per float
  usage: GPUBufferUsage.VERTEX,
  mappedAtCreation: true,
});
verticesBuffer.getMappedRange().set(cubeVertexArray);
verticesBuffer.unmap();

pipeline = device.createRenderPipeline({
  layout: "auto",
  vertex: {
    module: device.createShaderModule({
      code: basicVertWGSL,
    }),
    buffers: [
      {
        arrayStride: cubeVertexSize,
        attributes: [
          {
            // position
            shaderLocation: 0,
            offset: cubePositionOffset,
            format: "float32x4",
          },
          {
            // uv
            shaderLocation: 1,
            offset: cubeUVOffset,
            format: "float32x2",
          },
        ],
      },
    ],
  },
  fragment: {
    module: device.createShaderModule({
      code: sampleSelfWGSL,
    }),
    targets: [
      {
        format: presentationFormat,
      },
    ],
  },
  primitive: {
    topology: "triangle-list",

    // Backface culling since the cube is solid piece of geometry.
    // Faces pointing away from the camera will be occluded by faces
    // pointing toward the camera.
    cullMode: "front", // Instead of "back"
  },

  // Enable depth testing so that the fragment closest to the camera
  // is rendered in front.
  depthStencil: {
    depthWriteEnabled: true,
    depthCompare: "less",
    format: "depth24plus",
  },
});

depthTexture = device.createTexture({
  size: [window_get_width(), window_get_height()],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

// Create a sampler with linear filtering for smooth interpolation.
sampler = device.createSampler({
  magFilter: "linear",
  minFilter: "linear",
});

var uniformBufferSize = 4 * 16; // 4x4 matrix
uniformBuffer = device.createBuffer({
  size: uniformBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
});

// We will copy the frame's rendering results into this texture and
// sample it on the next frame.
cubeTexture = device.createTexture({
  size: [window_get_width(), window_get_height()],
  format: presentationFormat,
  usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST,
});

uniformBindGroup = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: {
        buffer: uniformBuffer,
      },
    },
    {
      binding: 1,
      resource: sampler,
    },
    {
      binding: 2,
      resource: cubeTexture.createView(),
    },
  ],
});

renderPassDescriptor = {
  colorAttachments: [
    {
      view: undefined, // Assigned later

      clearValue: [0.5, 0.5, 0.5, 1.0],
      loadOp: "clear",
      storeOp: "store",
    },
  ],
  depthStencilAttachment: {
    view: depthTexture.createView(),

    depthClearValue: 1.0,
    depthLoadOp: "clear",
    depthStoreOp: "store",
  },
};

var aspect = window_get_width() / window_get_height();
projectionMatrix = matrix_build_projection_perspective_fov(
  radtodeg((2 * pi) / 5),
  aspect,
  1,
  100.0
);
modelViewProjectionMatrix = matrix_build_identity();

getTransformationMatrix = function () {
  var viewMatrix = matrix_build_identity();
  viewMatrix = matrix_multiply(
    matrix_build(0, 0, 4, 0, 0, 0, 1, 1, 1), // Flipped sign
    viewMatrix
  );
  // This is not an equivalent of mat4.rotate in the original sample! GML doesn't
  // have a function for rotation around an arbitrary axis by given amount.
  var now = current_time / 50;
  viewMatrix = matrix_multiply(
    matrix_build(0, 0, 0, now, now, 0, 1, 1, 1),
    viewMatrix
  );

  modelViewProjectionMatrix = matrix_multiply(viewMatrix, projectionMatrix);

  return modelViewProjectionMatrix;
};

frame = function () {
  var transformationMatrix = getTransformationMatrix();
  device.queue.writeBuffer(
    uniformBuffer,
    0,
    transformationMatrix,
    0,
    array_length(transformationMatrix)
  );

  var swapChainTexture = GPU.getResourceTexture(surface_get_texture(application_surface));
  renderPassDescriptor.colorAttachments[0].view = swapChainTexture.createView();

  var commandEncoder = device.createCommandEncoder();
  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.setBindGroup(0, uniformBindGroup);
  passEncoder.setVertexBuffer(0, verticesBuffer);
  passEncoder.draw(cubeVertexCount);
  passEncoder.end_();

  // Copy the rendering results from the swapchain into |cubeTexture|.
  commandEncoder.copyTextureToTexture(
    {
      texture: swapChainTexture,
    },
    {
      texture: cubeTexture,
    },
    [window_get_width(), window_get_height()]
  );

  device.queue.submit([commandEncoder.finish()]);
};
