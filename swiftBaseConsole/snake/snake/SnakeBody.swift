//
//  SnakeBody.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class SnakeBody: SKShapeNode {
    
    init(position: CGPoint) {
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
              
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        self.position = position
        
        physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center:
            CGPoint(x: 5, y: 5))
        physicsBody?.isDynamic = true
        
        physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
