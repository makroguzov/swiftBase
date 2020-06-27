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
    static let Wall: UInt32 = 1 << 4
}

class GameScene: SKScene {
    private var snake: Snake!
    
    override func didMove(to view: SKView) {
        createBG(fileName: "bg_image")
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        
        addSwipe()
        
        snake = Snake(position: CGPoint(x: frame.midX, y: frame.midY))
        addChild(snake)
        
        createApple()
        createFrameWalls()
    
        physicsWorld.contactDelegate = self
        physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
        physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
    }
    
    func createBG(fileName: String) {
        let bgTexture: SKTexture = SKTexture(imageNamed: fileName)
        let bg: SKSpriteNode = SKSpriteNode(texture: bgTexture)

        let bgObject = SKNode()
        addChild(bgObject)
        
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        bg.size.height = self.frame.height
        bg.size.width = self.frame.width
        bg.zPosition = -1
        
        bgObject.addChild(bg)
    }

    private func createFrameWalls() {
        let leftWall = Wall(position: CGPoint(x: Wall.height / 2 , y: frame.maxY / 2), width: frame.maxY, zRotation: CGFloat.pi / 2)
        addChild(leftWall)
        
        let rigthtWall = Wall(position: CGPoint(x: frame.maxX - Wall.height / 2 , y: frame.maxY / 2), width: frame.maxY, zRotation: CGFloat.pi / 2)
        addChild(rigthtWall)
        
        let downWall = Wall(position: CGPoint(x: frame.maxX / 2, y: Wall.height / 2), width: frame.maxX - 2 * Wall.height, zRotation: 0)
        addChild(downWall)
        
        let upWall = Wall(position: CGPoint(x: frame.maxX / 2, y: frame.maxY - Wall.height), width: frame.maxX - 2 * Wall.height, zRotation: 0)
        addChild(upWall)
    }
    
    private func createApple() {
        let randX = CGFloat.random(in: 0..<frame.maxX - (10 + Wall.height))
        let randY = CGFloat.random(in: 0..<frame.maxY - (10 + Wall.height))
        
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
            self.removeAllChildren()
            createBG(fileName: "lose_screen")
        default:
            break
        }
    }
}
