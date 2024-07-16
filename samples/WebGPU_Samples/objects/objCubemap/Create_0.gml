// Source: https://webgpu.github.io/webgpu-samples/?sample=cubemap

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

var sampleCubemapWGSL = @"
  @group(0) @binding(1) var mySampler: sampler;
  @group(0) @binding(2) var myTexture: texture_cube<f32>;

  @fragment
  fn main(
    @location(0) fragUV: vec2f,
    @location(1) fragPosition: vec4f
  ) -> @location(0) vec4f {
    // Our camera and the skybox cube are both centered at (0, 0, 0)
    // so we can use the cube geometry position to get viewing vector to sample
    // the cube texture. The magnitude of the vector doesn't matter.
    var cubemapVec = fragPosition.xyz - vec3(0.5);
    // When viewed from the inside, cubemaps are left-handed (z away from viewer),
    // but common camera matrix convention results in a right-handed world space
    // (z toward viewer), so we have to flip it.
    cubemapVec.z *= -1;
    return textureSample(myTexture, mySampler, cubemapVec);
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

// Mapped buffers are not yet supported, so here we're going to use the
// writeBuffer function instead!
verticesBuffer = device.createBuffer({
  size: array_length(cubeVertexArray) * 4, // 4 bytes per float
  usage: GPUBufferUsage.VERTEX | GPUBufferUsage.COPY_DST, // COPY_DST required by writeBuffer
  //mappedAtCreation: true,
});
//new Float32Array(verticesBuffer.getMappedRange()).set(cubeVertexArray);
//verticesBuffer.unmap();
device.queue.writeBuffer(verticesBuffer, 0, cubeVertexArray);
//device.queue.submit([]);

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
      code: sampleCubemapWGSL,
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
    cullMode: "back", // Instead of "back"
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

// Cubemap image available under a Creative Commons Attribution 3.0 Unported
// License at https://www.humus.name/index.php?page=Textures&ID=58
imgSrcs = [
  sprPosX,
  sprNegX,
  sprPosY,
  sprNegY,
  sprPosZ,
  sprNegZ,
];

imageBitmaps = array_map(imgSrcs, function (sprite) {
  return GPU.getResourceTexture(sprite_get_texture(sprite, 0));
});

// Fetch the 6 separate images for negative/positive x, y, z axis of a cubemap
// and upload it into a GPUTexture.
//let cubemapTexture: GPUTexture;
//{
//  // The order of the array layers is [+X, -X, +Y, -Y, +Z, -Z]
//  const imgSrcs = [
//    '../../assets/img/cubemap/posx.jpg',
//    '../../assets/img/cubemap/negx.jpg',
//    '../../assets/img/cubemap/posy.jpg',
//    '../../assets/img/cubemap/negy.jpg',
//    '../../assets/img/cubemap/posz.jpg',
//    '../../assets/img/cubemap/negz.jpg',
//  ];
//  const promises = imgSrcs.map(async (src) => {
//    const response = await fetch(src);
//    return createImageBitmap(await response.blob());
//  });
//  const imageBitmaps = await Promise.all(promises);

cubemapTexture = device.createTexture({
  dimension: "2d",
  // Create a 2d array texture.
  // Assume each image has the same size.
  size: [sprite_get_width(imgSrcs[0]), sprite_get_height(imgSrcs[0]), 6],
  format: "rgba8unorm",
  usage:
    GPUTextureUsage.TEXTURE_BINDING |
    GPUTextureUsage.COPY_DST |
    GPUTextureUsage.RENDER_ATTACHMENT,
});

var commandEncoder = device.createCommandEncoder();
for (var i = 0; i < array_length(imageBitmaps); i++) {
  var imageBitmap = imageBitmaps[i];
  commandEncoder.copyTextureToTexture( // Instead of device.queue.copyExternalImageToTexture
    { texture: imageBitmap },
    { texture: cubemapTexture, origin: [0, 0, i] },
    [sprite_get_width(imgSrcs[i]), sprite_get_height(imgSrcs[i])]
  );
}
device.queue.submit([commandEncoder.finish()]);

var uniformBufferSize = 4 * 16; // 4x4 matrix
uniformBuffer = device.createBuffer({
  size: uniformBufferSize,
  usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
});

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
        offset: 0,
        size: uniformBufferSize,
      },
    },
    {
      binding: 1,
      resource: sampler,
    },
    {
      binding: 2,
      resource: cubemapTexture.createView({
        dimension: "cube",
      }),
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
  3000
);

modelMatrix = matrix_build(0, 0, 0, 0, 0, 0, 1000, 1000, 1000);
modelViewProjectionMatrix = matrix_build_identity();
viewMatrix = matrix_build_identity();

tmpMat4 = matrix_build_identity();

// Comppute camera movement:
// It rotates around Y axis with a slight pitch movement.
updateTransformationMatrix = function () {
  var now = current_time / 800;

  tmpMat4 = matrix_multiply(
    matrix_build(
      0, 0, 0,
      radtodeg(pi / 10) * sin(now),
      0,
      0,
      1, 1, 1
    ),
    viewMatrix
  );

  tmpMat4 = matrix_multiply(
    matrix_build(
      0, 0, 0,
      0,
      radtodeg(now * 0.2),
      0,
      1, 1, 1
    ),
    tmpMat4
  );

  modelViewProjectionMatrix = matrix_multiply(modelMatrix, tmpMat4);
  modelViewProjectionMatrix = matrix_multiply(modelViewProjectionMatrix, projectionMatrix);
};

frame = function () {
  updateTransformationMatrix();
  device.queue.writeBuffer(
    uniformBuffer,
    0,
    modelViewProjectionMatrix,
    0,
    array_length(modelViewProjectionMatrix)
  );
  renderPassDescriptor.colorAttachments[0].view = GPU.getCurrentTextureView();

  var commandEncoder = device.createCommandEncoder();
  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.setVertexBuffer(0, verticesBuffer);
  passEncoder.setBindGroup(0, uniformBindGroup);
  passEncoder.draw(cubeVertexCount);
  passEncoder.end_();
  device.queue.submit([commandEncoder.finish()]);
};
