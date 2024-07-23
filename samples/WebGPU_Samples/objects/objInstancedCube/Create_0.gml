// Source: https://webgpu.github.io/webgpu-samples/?sample=instancedCube

var instancedVertWGSL = @"
  struct Uniforms {
    modelViewProjectionMatrix : array<mat4x4f, 16>,
  }

  @binding(0) @group(0) var<uniform> uniforms : Uniforms;

  struct VertexOutput {
    @builtin(position) Position : vec4f,
    @location(0) fragUV : vec2f,
    @location(1) fragPosition: vec4f,
  }

  @vertex
  fn main(
    @builtin(instance_index) instanceIdx : u32,
    @location(0) position : vec4f,
    @location(1) uv : vec2f
  ) -> VertexOutput {
    var output : VertexOutput;
    output.Position = uniforms.modelViewProjectionMatrix[instanceIdx] * position;
    output.fragUV = uv;
    output.fragPosition = 0.5 * (position + vec4(1.0));
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
      code: instancedVertWGSL,
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
    cullMode: "front",
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

xCount = 4;
yCount = 4;
numInstances = xCount * yCount;
matrixFloatCount = 16; // 4x4 matrix
matrixSize = 4 * matrixFloatCount;
uniformBufferSize = numInstances * matrixSize;

// Allocate a buffer large enough to hold transforms for every
// instance.
uniformBuffer = device.createBuffer({
  size: uniformBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
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
  ],
});

var aspect = window_get_width() / window_get_height();
projectionMatrix = matrix_build_projection_perspective_fov(
  radtodeg((2 * pi) / 5),
  aspect,
  1,
  100.0
);

modelMatrices = array_create(numInstances);
mvpMatricesData = array_create(matrixFloatCount * numInstances, 0);

step = 4.0;

// Initialize the matrix data for every instance.
var m = 0;
for (var _x = 0; _x < xCount; _x++) {
  for (var _y = 0; _y < yCount; _y++) {
    modelMatrices[m] = matrix_build(
      step * (_x - xCount / 2 + 0.5),
      step * (_y - yCount / 2 + 0.5),
      0,
      0, 0, 0,
      1, 1, 1
    );
    m++;
  }
}

viewMatrix = matrix_build(0, 0, 12, 0, 0, 0, 1, 1, 1);

tmpMat4 =  matrix_build_identity();

// Update the transformation matrix data for each instance.
function updateTransformationMatrix() {
  var now = current_time / 50;

  var m = 0,
    i = 0;
  for (var _x = 0; _x < xCount; _x++) {
    for (var _y = 0; _y < yCount; _y++) {
      // This is not an equivalent of mat4.rotate in the original sample! GML
      // doesn't have a function for rotation around an arbitrary axis by given
      // amount.
      tmpMat4 = matrix_multiply(
        matrix_build(
          0, 0, 0,
          (_x + 0.5) * now,
          (_y + 0.5) * now,
          0,
          1, 1, 1
        ),
        modelMatrices[i]
      );

      tmpMat4 = matrix_multiply(tmpMat4, viewMatrix);
      tmpMat4 = matrix_multiply(tmpMat4, projectionMatrix);

      array_copy(mvpMatricesData, m, tmpMat4, 0, matrixFloatCount);

      i++;
      m += matrixFloatCount;
    }
  }
}

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

frame = function () {
  // Update the matrix data.
  updateTransformationMatrix();
  device.queue.writeBuffer(
    uniformBuffer,
    0,
    mvpMatricesData,
    0,
    array_length(mvpMatricesData)
  );

  renderPassDescriptor.colorAttachments[0].view = GPU.getCurrentTextureView();

  var commandEncoder = device.createCommandEncoder();
  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.setBindGroup(0, uniformBindGroup);
  passEncoder.setVertexBuffer(0, verticesBuffer);
  passEncoder.draw(cubeVertexCount, numInstances, 0, 0);
  passEncoder.end_();
  device.queue.submit([commandEncoder.finish()]);
};
