// Source: https://webgpu.github.io/webgpu-samples/?sample=twoCubes

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

var vertexPositionColorWGSL = @"
  @fragment
  fn main(
    @location(0) fragUV: vec2f,
    @location(1) fragPosition: vec4f
  ) -> @location(0) vec4f {
    return fragPosition;
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
      code: vertexPositionColorWGSL,
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

matrixSize = 4 * 16; // 4x4 matrix
offset = 256; // uniformBindGroup offset must be 256-byte aligned
var uniformBufferSize = offset + matrixSize;

uniformBuffer = device.createBuffer({
  size: uniformBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
});

uniformBindGroup1 = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: {
        buffer: uniformBuffer,
        offset: 0,
        size: matrixSize,
      },
    },
  ],
});

uniformBindGroup2  = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: {
        buffer: uniformBuffer,
        offset: offset,
        size: matrixSize,
      },
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

modelMatrix1 = matrix_build(-2, 0, 0, 0, 0, 0, 1, 1, 1);
modelMatrix2 = matrix_build(2, 0, 0, 0, 0, 0, 1, 1, 1);
modelViewProjectionMatrix1 = matrix_build_identity();
modelViewProjectionMatrix2 = matrix_build_identity();
viewMatrix = matrix_build(0, 0, 7, 0, 0, 0, 1, 1, 1); // Flipped sign

tmpMat41 = matrix_build_identity();
tmpMat42 = matrix_build_identity();

updateTransformationMatrix = function () {
  var now = current_time / 50;

  // This is not an equivalent of mat4.rotate in the original sample! GML doesn't
  // have a function for rotation around an arbitrary axis by given amount.
  tmpMat41 = matrix_multiply(
    matrix_build(0, 0, 0, now, now, 0, 1, 1, 1),
    modelMatrix1
  );
  tmpMat42 = matrix_multiply(
    matrix_build(0, 0, 0, -now, -now, 0, 1, 1, 1),
    modelMatrix2
  );

  modelViewProjectionMatrix1 = matrix_multiply(tmpMat41, viewMatrix);
  modelViewProjectionMatrix1 = matrix_multiply(
    modelViewProjectionMatrix1,
    projectionMatrix
  );
  modelViewProjectionMatrix2 = matrix_multiply(tmpMat42, viewMatrix);
  modelViewProjectionMatrix2 = matrix_multiply(
    modelViewProjectionMatrix2,
    projectionMatrix
  );
};

frame = function () {
  updateTransformationMatrix();
  device.queue.writeBuffer(
    uniformBuffer,
    0,
    modelViewProjectionMatrix1,
    0,
    array_length(modelViewProjectionMatrix1)
  );
  device.queue.writeBuffer(
    uniformBuffer,
    offset,
    modelViewProjectionMatrix2,
    0,
    array_length(modelViewProjectionMatrix2)
  );

  renderPassDescriptor.colorAttachments[0].view = GPU.getCurrentTextureView();

  var commandEncoder = device.createCommandEncoder();
  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.setVertexBuffer(0, verticesBuffer);

  // Bind the bind group (with the transformation matrix) for
  // each cube, and draw.
  passEncoder.setBindGroup(0, uniformBindGroup1);
  passEncoder.draw(cubeVertexCount);

  passEncoder.setBindGroup(0, uniformBindGroup2);
  passEncoder.draw(cubeVertexCount);

  passEncoder.end_();
  device.queue.submit([commandEncoder.finish()]);
};
