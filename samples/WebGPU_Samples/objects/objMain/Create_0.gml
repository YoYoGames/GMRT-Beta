sections = [
  {
    title: "Basic Graphics",
    samples: [
      objHelloTriangle,
      objHelloTriangleMSAA,
      objRotatingCube,
      objTwoCubes,
      objTexturedCube,
      objInstancedCube,
      objFractalCube,
      objCubemap,
    ],
  },
  {
    title: "GPGPU Demos",
    samples: [
      objComputeBoids,
      objComputeBoidsBuiltInRenderPipeline,
    ],
  },
];

createSample = function (sample) {
  instance_destroy(objSample);
  instance_create_layer(0, 0, layer, sample);
};

createSample(sections[0].samples[0]);

textScroll = 0;

var adapter = GPU.requestAdapter();

show_debug_message(adapter.features);
show_debug_message(adapter.info);
show_debug_message(adapter.isFallbackAdapter);
show_debug_message(adapter.limits);
