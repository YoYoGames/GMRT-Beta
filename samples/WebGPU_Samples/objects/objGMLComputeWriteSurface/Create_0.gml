surface = surface_create(256, 256);
var computeShader = new ComputeShader(@"
  @group(0) @binding(0) var surface : texture_storage_2d<bgra8unorm, write>;

  @compute @workgroup_size(16, 16)
  fn main(@builtin(global_invocation_id) id : vec3u) {
    textureStore(
      surface,
      vec2<i32>(i32(id.x), i32(id.y)),
      vec4<f32>(f32(id.x) / 255.0, f32(id.y) / 255.0, 0.0, 1.0)
    );
  }
");
computeShader.__addUniform({ name: "surface", type: ShaderUniformType.TEXTURE, group: 0, binding: 0 });
computeShader.setTexture(computeShader.getUniform("surface"), surface_get_texture(surface));
computeShader.dispatch(ceil(surface_get_width(surface) / 16), ceil(surface_get_height(surface) / 16));
computeShader.destroy();