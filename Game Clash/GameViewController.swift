//
//  GameViewController.swift
//  Game Clash
//
//  Created by Melvin Corners on 1/3/17.
//  Copyright © 2017 Melvin Corners. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let scene = TicTacFoe(fileNamed: "TicTacFoe"){
//            
//            // Configure the view
//            let skView = self.view as! SKView
//            skView.showsFPS = false
//            skView.showsNodeCount = false
//            
//            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            skView.ignoresSiblingOrder = true
//            
//            /* Set the scale mode to scale to fit the window */
//            scene.scaleMode = .aspectFit
//            
//            skView.presentScene(scene)
//        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
