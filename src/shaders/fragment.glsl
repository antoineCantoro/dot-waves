uniform float uTime;
uniform float uProgress;
varying vec2 vUv;
varying float strength;
float PI = 3.141592653589793238;

void main() {
  float squareCount = 200.0;
  float squareSize = 0.8;
  // float cirlceShape = step(0.5, distance(vUv, vec2(0.5)) + 0.1);
  // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0) / 10.0);
  float square = step(squareSize, mod((vUv.x) * squareCount, 1.0));
  square *= step(squareSize, mod((vUv.y) * squareCount, 1.0));
  
  float newStrength = strength * 4.5;
  // strength *= 3.0;
  
  float squareB = step(squareSize, mod((vUv.x) * squareCount + newStrength, 1.0 ) - newStrength);
  squareB *= step(squareSize, mod((vUv.y) * squareCount + newStrength, 1.0) - newStrength);

  float squareR = step(squareSize, mod((vUv.x) * squareCount, 1.0) + newStrength);
  squareR *= step(squareSize, mod((vUv.y) * squareCount, 1.0) + newStrength);

  vec3 finalColor = vec3(
    squareR * 0.8 + square ,
    square,
    squareB * 0.2 + 0.2 + square 
  );

  gl_FragColor = vec4(finalColor.r * sin(vUv.x) + strength, finalColor.g * sin(vUv.y) + strength, finalColor.b + strength, 0.9);
}