//
//  GameScene.swift
//  ShaderTest
//
//  Created by Sarah Smith on 2/26/16.
//  Copyright (c) 2016 Smithsoft Pty Ltd. All rights reserved.
//

import SpriteKit

public extension SKColor {
    
    func vec4() -> GLKVector4
    {
        var r:CGFloat = 0.0
        var g:CGFloat = 0.0
        var b:CGFloat = 0.0
        var a:CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return GLKVector4(v: (Float(r), Float(g), Float(b), Float(a)))
    }
}

class GameScene: SKScene
{

    override func didMoveToView(view: SKView)
    {
        let letterS = childNodeWithName("LetterS") as! SKSpriteNode
        
        let newSprite = SKSpriteNode(color: SKColor.whiteColor(), size: CGSize(width: 200, height: 200))
        newSprite.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        let shader = SKShader(fileNamed: "Gradient.fsh")
        
        let topColor = SKColor.redColor()
        let bottomColor = SKColor.blueColor()
        let uniforms = [
            SKUniform(name: "topColor", floatVector4: topColor.vec4()),
            SKUniform(name: "bottomColor", floatVector4: bottomColor.vec4())
        ]
        shader.uniforms = uniforms
        
        addChild(newSprite)
        
        newSprite.shader = shader
        
        letterS.shader = shader
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            _ = touch.locationInNode(self)
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
