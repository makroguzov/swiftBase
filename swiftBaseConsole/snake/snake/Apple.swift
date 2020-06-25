//
//  Apple.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class Apple: SKNode {
    convenience init(position: CGPoint){
        self.init()

        self.position = position
        
        physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
