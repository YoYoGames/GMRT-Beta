spriteVertexBuffer.destroy();
simParamBuffer.destroy();
for (var i = 0; i < array_length(particleBuffers); ++i) {
  particleBuffers[i].destroy();
}
