// Run our compute shader...
var commandEncoder = device.createCommandEncoder();
var passEncoder = commandEncoder.beginComputePass();
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, particleBindGroups[t % 2]);
passEncoder.dispatchWorkgroups(ceil(numParticles / 64));
passEncoder.end_();
device.queue.submit([commandEncoder.finish()]);

// Wait for it to finish...
device.queue.onSubmittedWorkDone(function () {
  if (destroyed) {
    // This callback was executed after our Clean Up event...
    return;
  }

  // Copy buffer with compute shader results to mapBuffer
  var commandEncoder = device.createCommandEncoder();
  commandEncoder.copyBufferToBuffer(particleBuffers[(t + 1) % 2], 0, mapBuffer, 0, 4 * array_length(initialParticleData));
  device.queue.submit([commandEncoder.finish()]);

  // Map the buffer and copy contained data into our uniforms buffer
  mapBuffer.mapAsync(GPUMapMode.READ, function (status, buffer) {
    if (status == GPUBufferMapAsyncStatus.SUCCESS) {
      buffer.getMappedRange().toBuffer(uniformBuffer, 0, 4 * array_length(initialParticleData), 0);
      buffer.unmap();
    }
  });
});

++t;

// Draw boids using data we got from the compute shader
shader_set(shBoids);
shader_set_uniform_f_buffer(shader_get_uniform(shBoids, "u_fData"), uniformBuffer, 0, numParticles);
vertex_submit(vertexBuffer, pr_trianglelist, -1);
shader_reset();
