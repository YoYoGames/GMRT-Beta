function vec3Cross(v1, v2) {
  return [
    v1[1] * v2[2] - v1[2] * v2[1],
    v1[2] * v2[0] - v1[0] * v2[2],
    v1[0] * v2[1] - v1[1] * v2[0],
  ];
}

function vec3Normalize(v) {
  var n = 1 / sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
  return [
    v[0] * n,
    v[1] * n,
    v[2] * n,
  ];
}

function vec3Subtract(v1, v2) {
  return [
    v1[0] - v2[0],
    v1[1] - v2[1],
    v1[2] - v2[2],
  ];
}

function vec3Add(v1, v2) {
  return [
    v1[0] + v2[0],
    v1[1] + v2[1],
    v1[2] + v2[2],
  ];
}

function vec3Dot(v1, v2) {
  return dot_product_3d(v1[0], v1[1], v1[2], v2[0], v2[1], v2[2]);
}
