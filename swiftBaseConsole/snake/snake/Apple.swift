//
//  Apple.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class Apple: SKNode {
    private var appleTexture :SKTexture
    private var apple: SKSpriteNode
    
    init(position: CGPoint){
        appleTexture = SKTexture(imageNamed: "apple_image.jpg")
        apple = SKSpriteNode(texture: appleTexture)
              
        super.init()
        
        self.position = position
        creTexture()
        
        physicsBody = SKPhysicsBody(circleOfRadius: 8.0, center: CGPoint(x: 0, y: 0))
        physicsBody?.categoryBitMask = CollisionCategories.Apple
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creTexture() {
        apple.size.height = 22.0
        apple.size.width = 22.0
        
        self.addChild(apple)
    }
}
