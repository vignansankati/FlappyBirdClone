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
    
    override func didMove(to view: SKView) {
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
