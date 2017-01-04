//
//  MainMenuViewController.swift
//  Game Clash
//
//  Created by Melvin Corners on 1/3/17.
//  Copyright © 2017 Melvin Corners. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController {
    
    //Labels
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var clashLabel: UILabel!
    @IBOutlet weak var selectedGameLabel: UILabel!
    
    
    //Buttons
    @IBOutlet weak var ticTacToeButtonOutlet: UIButton!
    @IBAction func ticTacToeButtonAction(_ sender: UIButton) {
        
    }
    
    //Main Menu Music
    var mainMenuMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "Oh yeah", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    
    //Swoosh Sounds
    var swooshSound: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "swoosh", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            return player
        } catch {
            return nil
        }
    }()
    
    //The animations for when the view controller is first loaded
    func beginningAnimations(){
        //Animate 'Game' in from the left
        gameLabel.center.x = self.view.frame.width - 200
        UIView.animate(withDuration: 0.5, delay: 0.7, usingSpringWithDamping: 3.0, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.swooshSound?.play()
            self.gameLabel.center.x = self.view.frame.width * 2.0
        }), completion: nil)
        
        //Animates 'Clash' in from the right
        clashLabel.center.x = self.view.frame.width + 200
        UIView.animate(withDuration: 0.5, delay: 1.2, usingSpringWithDamping: 3.0, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.swooshSound?.play()
            self.clashLabel.center.x = self.view.frame.width / 2.0
        }), completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuMusic?.play()
        beginningAnimations()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
