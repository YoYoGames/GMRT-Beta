// Source: https://webgpu.github.io/webgpu-samples/?sample=texturedCube

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

var sampleTextureMixColorWGSL = @"
  @group(0) @binding(1) var mySampler: sampler;
  @group(0) @binding(2) var myTexture: texture_2d<f32>;
  
  @fragment
  fn main(
    @location(0) fragUV: vec2f,
    @location(1) fragPosition: vec4f
  ) -> @location(0) vec4f {
    return textureSample(myTexture, mySampler, fragUV) * fragPosition;
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
      code: sampleTextureMixColorWGSL,
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

var uniformBufferSize = 4 * 16; // 4x4 matrix
uniformBuffer = device.createBuffer({
  size: uniformBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
});

// Use following instead of the commented out code to get texture views for
// sprites (or surfaces).
cubeTextureView = GPU.getResourceTextureView(sprite_get_texture(sprDi3d, 0));

// Fetch the image and upload it into a GPUTexture.
//let cubeTexture: GPUTexture;
//{
//  const response = await fetch("../../assets/img/Di-3d.png");
//  const imageBitmap = await createImageBitmap(await response.blob());

//  cubeTexture = device.createTexture({
//    size: [imageBitmap.width, imageBitmap.height, 1],
//    format: "rgba8unorm",
//    usage:
//      GPUTextureUsage.TEXTURE_BINDING |
//      GPUTextureUsage.COPY_DST |
//      GPUTextureUsage.RENDER_ATTACHMENT,
//  });
//  device.queue.copyExternalImageToTexture(
//    { source: imageBitmap },
//    { texture: cubeTexture },
//    [imageBitmap.width, imageBitmap.height]
//  );
//}

// Create a sampler with linear filtering for smooth interpolation.
sampler = device.createSampler({
  magFilter: "linear",
  minFilter: "linear",
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
      resource: cubeTextureView, //cubeTexture.createView(),
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
  // This is not an equivalent of mat4.rotate in the original sample! GML doesn"t
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
  renderPassDescriptor.colorAttachments[0].view = GPU.getCurrentTextureView();

  var commandEncoder = device.createCommandEncoder();
  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.setBindGroup(0, uniformBindGroup);
  passEncoder.setVertexBuffer(0, verticesBuffer);
  passEncoder.draw(cubeVertexCount);
  passEncoder.end_();
  device.queue.submit([commandEncoder.finish()]);
};
