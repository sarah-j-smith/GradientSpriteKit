

void main() {
    
    // Fill whole area with color
    //    gl_FragColor = vec4(mix(bottomColor, topColor, v_tex_coord.y));
    
    // Direct pass-through
    //    gl_FragColor = SKDefaultShading();
    
    // Only fill alpha > 0.0 pixels
    gl_FragColor = SKDefaultShading() * vec4(mix(bottomColor, topColor, v_tex_coord.y));
}