# GradientSpriteKit
Example of how to put a gradient over a sprite in SpriteKit.

## Shader Source

The executive summary: create a file called Gradient.fsh and add this source to it:

    void main() {
    
        gl_FragColor = SKDefaultShading() * vec4(mix(bottomColor, topColor, v_tex_coord.y));
    }
    
Then just set it on to your `SKSpriteNode` object:

    override func didMoveToView(view: SKView)
    {
        let letterS = childNodeWithName("LetterS") as! SKSpriteNode
        let shader = SKShader(fileNamed: "Gradient.fsh")
        let topColor = SKColor.redColor()
        let bottomColor = SKColor.blueColor()
        let uniforms = [
            SKUniform(name: "topColor", floatVector4: topColor.vec4()),
            SKUniform(name: "bottomColor", floatVector4: bottomColor.vec4())
        ]
        shader.uniforms = uniforms
        letterS.shader = shader
    }

That's it.    

![Screenshot](screenshot.png)