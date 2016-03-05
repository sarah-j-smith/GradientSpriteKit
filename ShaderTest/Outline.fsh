
void main(void) {
    vec4 color = texture2D(u_texture, v_tex_coord);
    
    float alpha = color.a;
    vec2 texturePos = v_tex_coord.xy;
    vec2 ss = u_step_size;
    float diff0 = abs(alpha - texture2D( u_texture, texturePos + vec2( ss.x, 0.0 ) ).a);
    float diff1 = abs(alpha - texture2D( u_texture, texturePos + vec2( -ss.x, 0.0 ) ).a);
    float diff2 = abs(alpha - texture2D( u_texture, texturePos + vec2( 0.0, ss.y ) ).a);
    float diff3 = abs(alpha - texture2D( u_texture, texturePos + vec2( 0.0, -ss.y ) ).a);
    alpha = max(max(diff0, diff1), max(diff2, diff3));

    // return a pre-multiplied value for frag color
    gl_FragColor = color + vec4(u_color.rgb * alpha, alpha);
}