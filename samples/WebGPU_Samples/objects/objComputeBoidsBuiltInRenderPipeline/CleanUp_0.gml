vertex_format_delete(vertexFormat);
vertex_delete_buffer(vertexBuffer);
simParamBuffer.destroy();
for (var i = 0; i < array_length(particleBuffers); ++i) {
  particleBuffers[i].destroy();
}
mapBuffer.destroy();
buffer_delete(uniformBuffer);
destroyed = true;
