//
//  GameViewController.swift
//  snake
//
//  Created by MACUSER on 25.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            let scene = GameScene()
            scene.scaleMode = .resizeFill
            
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
