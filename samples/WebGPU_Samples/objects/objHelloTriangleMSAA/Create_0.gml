// Source: https://webgpu.github.io/webgpu-samples/?sample=helloTriangleMSAA

var triangleVertWGSL = @"
  @vertex
  fn main(
    @builtin(vertex_index) VertexIndex : u32
  ) -> @builtin(position) vec4f {
    var pos = array<vec2f, 3>(
      vec2(0.0, 0.5),
      vec2(-0.5, -0.5),
      vec2(0.5, -0.5)
    );
  
    return vec4f(pos[VertexIndex], 0.0, 1.0);
  }
";

var redFragWGSL = @"
  @fragment
  fn main() -> @location(0) vec4f {
    return vec4(1.0, 0.0, 0.0, 1.0);
  }
";

adapter = GPU.requestAdapter();
device = adapter.requestDevice();
var presentationFormat = GPU.getPreferredCanvasFormat();

var sampleCount = 4;

pipeline = device.createRenderPipeline({
  layout: "auto",
  vertex: {
    module: device.createShaderModule({
      code: triangleVertWGSL,
    }),
  },
  fragment: {
    module: device.createShaderModule({
      code: redFragWGSL,
    }),
    targets: [
      {
        format: presentationFormat,
      },
    ],
  },
  primitive: {
    topology: "triangle-list",
  },
  multisample: {
    count: sampleCount,
  },
});

texture = device.createTexture({
  size: [window_get_width(), window_get_height()], // Instead of canvas.width and canvas.height
  sampleCount,
  format: presentationFormat,
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});
view = texture.createView();

frame = function () {
  var commandEncoder = device.createCommandEncoder();

  var renderPassDescriptor = {
    colorAttachments: [
      {
        view,
        resolveTarget: GPU.getCurrentTextureView(),
        clearValue: [0, 0, 0, 1],
        loadOp: "clear",
        storeOp: "discard",
      },
    ],
  };

  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.draw(3);
  passEncoder.end_();

  device.queue.submit([commandEncoder.finish()]);
};
