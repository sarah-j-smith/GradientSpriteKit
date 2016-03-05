

void main() {
    
    // Fill whole area with color
    //    gl_FragColor = vec4(mix(bottomColor, topColor, v_tex_coord.y));
    
    // Direct pass-through
    //    gl_FragColor = SKDefaultShading();
    
    // Only fill alpha > 0.0 pixels
    vec4 color = texture2D(u_texture, v_tex_coord);
    gl_FragColor = color * vec4(mix(bottomColor, topColor, v_tex_coord.y));
}