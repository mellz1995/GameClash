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
        
        let scene = GameScene(fileNamed: "GameScene")
        let skView = self.view as! SKView
        scene?.scaleMode = .aspectFit
        skView.presentScene(scene)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
