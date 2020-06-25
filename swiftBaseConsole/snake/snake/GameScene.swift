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
    
    var bgTexture: SKTexture!
    var bg = SKSpriteNode()
    var bgObject = SKNode()
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg_image.jpg")
        self.addChild(bgObject)
        createBG()
        
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
    
    func createBG() {
        bgTexture = SKTexture(imageNamed: "bg_image.jpg")
        
        bg = SKSpriteNode(texture: bgTexture)
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        bg.size.height = self.frame.height
        bg.size.width = self.frame.width
        bg.zPosition = -1
        
        bgObject.addChild(bg)
    }

    private func createApple() {
        let randX = CGFloat.random(in: 0..<frame.maxX - 10)
        let randY = CGFloat.random(in: 0..<frame.maxY - 10)
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))        
        addChild(apple)

        let appleTexture :SKTexture! = SKTexture(imageNamed: "apple_image.jpg")
        let appleTextureNode: SKSpriteNode = SKSpriteNode(texture: appleTexture)
        
        appleTextureNode.size.height = 20.0
        appleTextureNode.size.width = 20.0
        
        apple.addChild(appleTextureNode)
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
            
            //exit(1)
            break
        default:
            break
        }
    }
}
