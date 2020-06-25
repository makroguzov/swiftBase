//
//  Snake.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit

class Snake: SKShapeNode {
  enum Directions {
        case rigth
        case up
        case left
        case down
    }
    
    private var body = [SnakeBody]()
    private let moveSpeed: CGFloat = 100.0
    private var direction: Directions = .up
    
    private var angle: CGFloat {
        switch direction {
        case .down:
            return CGFloat.pi
        case .rigth:
            return CGFloat.pi / 2
        case .left:
            return (CGFloat.pi * 3) / 2
        case .up:
            return 0.0
        }
    }
    
    convenience init(position: CGPoint){
        self.init()
        
        let head = SnakeHead(position: position)
        body.append(head)
        
        addChild(head)
    }
    
    func addBodyPart(){
        let newBodyPart = SnakeBody(position: body[0].position)
        body.append(newBodyPart)
        
        addChild(newBodyPart)
    }
    
    func changeDirection(onDirection: Directions) {
        guard direction != onDirection else {
            return
        }
        direction = onDirection
    }
    
    func move() {
        moveHead(body[0])
        
        for i in 1..<body.count {
            let current = body[i]
            let previous = body[i - 1]
            moveBody(current, previous: previous)
        }
    }
    
    private func moveHead(_ head: SnakeBody) {
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)
    }
    
    private func moveBody(_ part: SnakeBody, previous: SnakeBody) {
        let moveAktion = SKAction.move(to: previous.position, duration: 0.1)
        part.run(moveAktion)
    }
}
