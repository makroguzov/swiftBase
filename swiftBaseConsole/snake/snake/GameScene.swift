//
//  GameScene.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 1
    static let SnakeHead: UInt32 = 1 << 1
    static let Apple: UInt32 = 1 << 2
    static let EdgeBody: UInt32 = 1 << 3
}

class GameScene: SKScene {
    private var snake: Snake!
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        
        addSwipe()
        
        snake = Snake(position: CGPoint(x: frame.midX, y: frame.midY))
        addChild(snake)
        
        createApple()
    
        physicsWorld.contactDelegate = self
        physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
        physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
    }
        
    private func createApple() {
        let randX = CGFloat.random(in: 0..<frame.maxX - 5)
        let randY = CGFloat.random(in: 0..<frame.maxY - 5)
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        addChild(apple)
    }
    
    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        
        for direction in directions {
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            swipeDown.direction = direction
            self.view!.addGestureRecognizer(swipeDown)
        }
    }
    
    @objc func handleSwipeGesture(_ gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction {
        case .down:
            snake.changeDirection(onDirection: .down)
        case .left:
            snake.changeDirection(onDirection: .left)
        case .right:
            snake.changeDirection(onDirection: .rigth)
        case .up:
            snake.changeDirection(onDirection: .up)
        default:
            return
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake.move()
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bytes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bytes ^ CollisionCategories.SnakeHead
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake.addBodyPart()
            
            apple?.removeFromParent()
            createApple()
        case CollisionCategories.EdgeBody:
            break
        default:
            break
        }
    }
}
