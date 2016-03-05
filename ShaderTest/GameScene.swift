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
    
    private func outlineShader(withSpriteSize spriteSize: CGSize) -> SKShader
    {
        let stepSize = GLKVector2Make(Float(2.0/spriteSize.width), Float(2.0/spriteSize.height))
        let outlineShader = SKShader(fileNamed: "Outline.fsh")
        let outlineColor = SKColor.cyanColor()
        let uniforms2 = [
            SKUniform(name: "u_step_size", floatVector2: stepSize),
            SKUniform(name: "u_color", floatVector4: outlineColor.vec4())
        ]
        outlineShader.uniforms = uniforms2
        return outlineShader
    }
    
    private func gradientShader() -> SKShader
    {
        let shader = SKShader(fileNamed: "Gradient.fsh")
        
        let topColor = SKColor.redColor()
        let bottomColor = SKColor.blueColor()
        let uniforms = [
            SKUniform(name: "topColor", floatVector4: topColor.vec4()),
            SKUniform(name: "bottomColor", floatVector4: bottomColor.vec4())
        ]
        shader.uniforms = uniforms
        return shader
    }

    override func didMoveToView(view: SKView)
    {
        let letterS = childNodeWithName("LetterS") as! SKSpriteNode
        let letterSTop = childNodeWithName("LetterSTop") as! SKSpriteNode
        let minion = childNodeWithName("Minion") as! SKSpriteNode
        let minionPad = childNodeWithName("MinionPadded") as! SKSpriteNode
        let boss = childNodeWithName("Boss") as! SKSpriteNode
        let bossPadded = childNodeWithName("BossPadded") as! SKSpriteNode
        
        let newSprite = SKSpriteNode(color: SKColor.whiteColor(), size: CGSize(width: 200, height: 200))
        newSprite.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        
        addChild(newSprite)
        let gradient = gradientShader()
        newSprite.shader = gradient
        letterS.shader = gradient
        
        for sprite in [ minion, minionPad, boss, bossPadded, letterSTop]
        {
            sprite.shader = outlineShader(withSpriteSize: sprite.size)
        }
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
