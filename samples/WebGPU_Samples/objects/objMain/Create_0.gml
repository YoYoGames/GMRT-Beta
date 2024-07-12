samples = [
	objHelloTriangle,
	objHelloTriangleMSAA,
	objRotatingCube,
	objTwoCubes,
	objTexturedCube,
];

createSample = function (sample) {
	instance_destroy(objSample);
	instance_create_layer(0, 0, layer, sample);
};

createSample(samples[0]);
