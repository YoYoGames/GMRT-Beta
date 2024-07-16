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
];

createSample = function (sample) {
  instance_destroy(objSample);
  instance_create_layer(0, 0, layer, sample);
};

createSample(sections[0].samples[0]);

textScroll = 0;
