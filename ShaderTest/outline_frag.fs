uniform sampler2D u_texture;

void main()
{
    vec2 texturePos = gl_TexCoord[0].xy;
    vec4 outColor = texture2D(u_texture, texturePos);
    float newAlpha = outColor.a * 4.0;
    newAlpha -= texture2D( u_texture, texturePos + vec2( 0.01, 0.0 ) ).a;
    newAlpha -= texture2D( u_texture, texturePos + vec2( -0.01, 0.0 ) ).a;
    newAlpha -= texture2D( u_texture, texturePos + vec2( 0.0, 0.01 ) ).a;
    newAlpha -= texture2D( u_texture, texturePos + vec2( 0.0, -0.01 ) ).a;
    gl_FragColor = vec4(1.0, 0.2, 1.0	, clamp(newAlpha, 0.0, 1.0));
}
