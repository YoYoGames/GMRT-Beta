// Source: https://webgpu.github.io/webgpu-samples/?sample=helloTriangle

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
});

// Either do this or use method(self, frame), otherwise device, pipeline etc.
// won't be defined!
frame = function () {
  var commandEncoder = device.createCommandEncoder();
  var textureView = GPU.getCurrentTextureView(); // Instead of context.getCurrentTexture().createView()

  var renderPassDescriptor = {
    colorAttachments: [
      {
        view: textureView,
        clearValue: [0, 0, 0, 1],
        loadOp: "clear",
        storeOp: "store",
      },
    ],
  };

  var passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
  passEncoder.setPipeline(pipeline);
  passEncoder.draw(3);
  passEncoder.end_(); // end is a reserved keyword in GML :(

  device.queue.submit([commandEncoder.finish()]);

  //GPU.requestAnimationFrame(frame) // Don't do this or the game will freeze!
};

//GPU.requestAnimationFrame(frame) // Call in the Draw event instead!
