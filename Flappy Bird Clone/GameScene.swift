//
//  GameScene.swift
//  Flappy Bird Clone
//
//  Created by Vignan Sankati on 4/22/17.
//  Copyright © 2017 Vignan Sankati. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // created a bird node
    var bird = SKSpriteNode()
    var backgroundImage = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        let backTexture = SKTexture(imageNamed: "bg.png")
        
        let moveBackAnimation = SKAction.move(by: CGVector(dx: -backTexture.size().width, dy: 0.0), duration: 5)
        let shiftBackAnimation = SKAction.move(by: CGVector(dx: backTexture.size().width, dy: 0.0), duration: 0)
        let backMovement = SKAction.repeatForever(SKAction.sequence([moveBackAnimation, shiftBackAnimation]))
        
        for i in 0 ..< 3  {
            backgroundImage = SKSpriteNode(texture: backTexture)
            backgroundImage.position = CGPoint(x: backTexture.size().width * CGFloat(i), y: self.frame.midY)
            backgroundImage.size.height = self.frame.height
            backgroundImage.run(backMovement)
            self.addChild(backgroundImage)
            backgroundImage.zPosition = -1
        }
        
        
        //created a sprite kit texture
        let flappyBirdTexture = SKTexture(imageNamed: "flappy1.png")
        let flappyBirdFlyingTexture = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animate(with: [flappyBirdTexture, flappyBirdFlyingTexture], timePerFrame: 0.1)
        let birdFlap = SKAction.repeatForever(animation)
        
        //added the created texture to bird node
        bird = SKSpriteNode(texture: flappyBirdTexture)
        //positioning the bird node created
        bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bird.run(birdFlap)
        
        //adding the bird to the viewcontroller
        self.addChild(bird)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
