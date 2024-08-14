attribute vec2 in_Position;
attribute float in_Index;

varying vec4 v_vColor;

uniform vec4 u_fData[1500]; // [(position0.xy, velocity0.xy), ...]

void main() {
  vec4 particleData = u_fData[int(in_Index)];
  vec2 particlePos = particleData.xy;
  vec2 particleVel = particleData.zw;

  float angle = -atan(particleVel.x, particleVel.y);
  vec2 pos = vec2(
    (in_Position.x * cos(angle)) - (in_Position.y * sin(angle)),
    (in_Position.x * sin(angle)) + (in_Position.y * cos(angle))
  );

  gl_Position = vec4(pos + particlePos, 0.0, 1.0);
  v_vColor = vec4(
    1.0 - sin(angle + 1.0) - particleVel.y,
    pos.x * 100.0 - particleVel.y + 0.1,
    particleVel.x + cos(angle + 0.5),
    1.0);
}
