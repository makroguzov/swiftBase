//
//  SnakeHead.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class SnakeHead: SnakeBody {
    override init(position: CGPoint) {
        super.init(position: position)
        
        physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        physicsBody?.contactTestBitMask = CollisionCategories.Apple |
            CollisionCategories.Wall | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
