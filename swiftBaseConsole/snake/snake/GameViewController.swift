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
import AVFoundation

class GameViewController: UIViewController {
    var backgroundMusicPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            
            let scene = GameScene(size: CGSize(width: 2024, height: 768))
            scene.scaleMode = .resizeFill
            
            view.ignoresSiblingOrder = true
            
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            //playBackgroundMusic(fileName: "bg_audio")
            //putBackgroundImage(fileName: "bg_image")
            
            view.presentScene(scene)
        }
    }
    
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer.stop()
    }
    
    func playBackgroundMusic(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: nil)
        var error : NSError? = nil
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch let error1 as NSError {
            error = error1
            backgroundMusicPlayer = nil
        }
        if backgroundMusicPlayer == nil {
            print("Could not create audio player: \(error!)")
            return
        }
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
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
