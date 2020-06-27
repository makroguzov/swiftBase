//
//  Wall.swift
//  snake
//
//  Created by MACUSER on 27.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class Wall: SKNode {
    private static let wallTexture: SKTexture = SKTexture(imageNamed: "wall_texture.jpg")
    private var wall: SKSpriteNode!
    static let height: CGFloat = 15
    private var width: CGFloat
    
    init(position: CGPoint, width: CGFloat, zRotation: CGFloat) {
        self.width = width
        
        super.init()
        
        self.position = position
        self.zRotation = zRotation
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: Wall.height), center: CGPoint(x: 0, y: 0))
        physicsBody?.categoryBitMask = CollisionCategories.Wall
        
        creTexture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creTexture() {
        wall = SKSpriteNode(texture: Wall.wallTexture)

        wall.size.height = Wall.height
        wall.size.width = width
        
        self.addChild(wall)
    }
    
}
