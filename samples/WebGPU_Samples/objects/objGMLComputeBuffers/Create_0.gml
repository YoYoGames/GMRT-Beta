var floats = [0, 1, 2, 3];
var length = array_length(floats);
var size = length * buffer_sizeof(buffer_f32);
var bufferIn = new ComputeBuffer(size);
bufferIn.fromFloatArray(floats);
var bufferOut = new ComputeBuffer(size, true);
var computeShader = new ComputeShader(@"
  @group(0) @binding(0) var<uniform> value : f32;
  @group(0) @binding(1) var<storage, read> bufferIn : array<f32>;
  @group(0) @binding(2) var<storage, read_write> bufferOut : array<f32>;

  @compute @workgroup_size(1)
  fn main(@builtin(global_invocation_id) id : vec3u) {
    bufferOut[id.x] = bufferIn[id.x] + value;
  }
");
if (computeShader.isCompiled) {
  computeShader.__addUniform({ name: "value", type: ShaderUniformType.FLOAT32, group: 0, binding: 0, size: buffer_sizeof(buffer_f32) });
  computeShader.__addUniform({ name: "bufferIn", type: ShaderUniformType.BUFFER, group: 0, binding: 1 });
  computeShader.__addUniform({ name: "bufferOut", type: ShaderUniformType.BUFFER, group: 0, binding: 2 });
  computeShader.setFloat(computeShader.getUniform("value"), 10);
  computeShader.setBuffer(computeShader.getUniform("bufferIn"), bufferIn);
  computeShader.setBuffer(computeShader.getUniform("bufferOut"), bufferOut);
  computeShader.dispatch(length);
  result = bufferOut.toFloatArray();
} else {
  result = "";
  var info = computeShader.getCompilationInfo();
  for (var i = 0; i < array_length(info); ++i) {
    var message = info[i];
    result += $"{message.type} on line {message.lineNumber}, pos. {message.linePosition}: {message.message}\n";
  }
}
computeShader.destroy();
bufferIn.destroy()
bufferOut.destroy();
