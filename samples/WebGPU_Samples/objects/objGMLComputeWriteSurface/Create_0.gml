surface = surface_create(256, 256);
var computeShader = new ComputeShader(@"
  @group(0) @binding(0) var<uniform> matrix: mat4x4<f32>;
  @group(0) @binding(1) var surface: texture_storage_2d<bgra8unorm, write>;

  @compute @workgroup_size(16, 16)
  fn main(@builtin(global_invocation_id) id : vec3<u32>) {
    let texSize = textureDimensions(surface).xy;
    let cellSize = texSize / vec2u(4, 4);
    let cell = id.xy / cellSize;
    let x = min(cell.x, 3u);
    let y = min(cell.y, 3u);
    let value = matrix[y][x];
    let color = vec4<f32>(value, value, value, 1.0);
    textureStore(surface, vec2<i32>(id.xy), color);
  }
");
error = "";
if (computeShader.isCompiled) {
  computeShader.__addUniform({ name: "matrix", type: ShaderUniformType.MAT4, group: 0, binding: 0, size: buffer_sizeof(buffer_f32) * 16 });
  computeShader.__addUniform({ name: "surface", type: ShaderUniformType.TEXTURE, group: 0, binding: 1 });
  var matrix = array_create(16);
  for (var i = 0; i < 16; ++i) {
    matrix[i] = i / 16;
  }
  computeShader.setMatrixArray(computeShader.getUniform("matrix"), matrix);
  computeShader.setTexture(computeShader.getUniform("surface"), surface_get_texture(surface));
  computeShader.dispatch(ceil(surface_get_width(surface) / 16), ceil(surface_get_height(surface) / 16));
} else {
  var info = computeShader.getCompilationInfo();
  for (var i = 0; i < array_length(info); ++i) {
    var message = info[i];
    error += $"{message.type} on line {message.lineNumber}, pos. {message.linePosition}: {message.message}\n";
  }
}
computeShader.destroy();
