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
    
    //Segue Variables
    let mainMenuToTicTacToeAnimator = MainMenuToTicTacToeAnimator()
    
    //Button variables
    var ticTacToeButtonValue = 0
    var randomPlayButtonValue = 0
    var favoritesButtonValue = 0
    var multiPlayerButtonValue = 0
    var dailySpinButtonValue = 0
    var storeButtonValue = 0
    
    //Boolean to see if this is the first time this has been viewed. This is so the music won't overlap when coming back to the main menu
    var firstView = false
    
    //Boolean for if a player chooses one button and then selects another button, the labels will behave correctly
    var activeButton = false
    
    //Labels
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var clashLabel: UILabel!
    @IBOutlet weak var selectedGameLabel: UILabel!
    
    
    //Buttons
    @IBOutlet weak var ticTacToeButtonOutlet: UIButton!
    @IBAction func ticTacToeButtonAction(_ sender: UIButton) {
        
        //Set all other button variables to 0
        randomPlayButtonValue = 0
        favoritesButtonValue = 0
        multiPlayerButtonValue = 0
        dailySpinButtonValue = 0
        storeButtonValue = 0
     
        ticTacToeButtonValue += 1
        
        if ticTacToeButtonValue == 1 {
            selectedGameLabel.text = "Play Tic Tac Toe"
            if !activeButton {
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
        
        else if ticTacToeButtonValue != 1 && randomPlayButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            //Resets variable back to 0 and Call function to animate button and label off the screen
            ticTacToeButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
    }
    
    @IBOutlet weak var randomPlayButtonOutlet: UIButton!
    @IBAction func randomPlayButtonAction(_ sender: UIButton) {
        //Set all other button variables to 0
        ticTacToeButtonValue = 0
        favoritesButtonValue = 0
        multiPlayerButtonValue = 0
        dailySpinButtonValue = 0
        storeButtonValue = 0
        
        randomPlayButtonValue += 1
        
        if randomPlayButtonValue == 1{
            selectedGameLabel.text = "Play a Random Game!"
            if !activeButton{
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
            
        else if randomPlayButtonValue != 1 && ticTacToeButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            //Resets variable back to 0 and Call function to animate button and label off the screen
            randomPlayButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
    }
    
    @IBOutlet weak var favoritesButtonOutlet: UIButton!
    @IBAction func favoritesButtonAction(_ sender: UIButton) {
        //Set all other button variables to 0
        ticTacToeButtonValue = 0
        randomPlayButtonValue = 0
        multiPlayerButtonValue = 0
        dailySpinButtonValue = 0
        storeButtonValue = 0
        
        favoritesButtonValue += 1
        
        if favoritesButtonValue == 1{
            selectedGameLabel.text = "Go to your favorites!"
            if !activeButton{
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
        
        else if randomPlayButtonValue != 1 && ticTacToeButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            //Resets variable back to 0 and Call function to animate button and label off the screen
            favoritesButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
        
    }
   
    @IBOutlet weak var multiPlayerButtonOutlet: UIButton!
    @IBAction func mutliPlayerButtonAction(_ sender: UIButton) {
        //Set all other button variables to 0
        ticTacToeButtonValue = 0
        randomPlayButtonValue = 0
        favoritesButtonValue = 0
        dailySpinButtonValue = 0
        storeButtonValue = 0
        
        multiPlayerButtonValue += 1
        
        if multiPlayerButtonValue == 1 {
            selectedGameLabel.text = "Multiplayer Games"
            if !activeButton{
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
        
        else if ticTacToeButtonValue != 1 && randomPlayButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            multiPlayerButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
    }
    
    @IBOutlet weak var dailySpendButtonOutlet: UIButton!
    @IBAction func dailySpendButtonAction(_ sender: UIButton) {
        //Set all other button variables to 0
        ticTacToeButtonValue = 0
        randomPlayButtonValue = 0
        favoritesButtonValue = 0
        multiPlayerButtonValue = 0
        storeButtonValue = 0
        
        dailySpinButtonValue += 1
        
        if dailySpinButtonValue == 1 {
            selectedGameLabel.text = "Feeling Lucky?"
            if !activeButton{
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
        else if ticTacToeButtonValue != 1 && randomPlayButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            dailySpinButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
        
    }
    
    @IBOutlet weak var storeButtonOutlet: UIButton!
    @IBAction func storeButtonAction(_ sender: UIButton) {
        //Set all other button variables to 0
        ticTacToeButtonValue = 0
        randomPlayButtonValue = 0
        favoritesButtonValue = 0
        multiPlayerButtonValue = 0
        dailySpinButtonValue = 0
        
        storeButtonValue += 1
        
        if storeButtonValue == 1{
            selectedGameLabel.text = "Check out the store!"
            if !activeButton{
                animatePlayButtonAndSelectedGameButtonOn()
            }
        }
        else if ticTacToeButtonValue != 1 && randomPlayButtonValue != 1 && favoritesButtonValue != 1 && multiPlayerButtonValue != 1 && dailySpinButtonValue != 1 && storeButtonValue != 1{
            storeButtonValue = 0
            animartePlayButtonAndSelectedGameButtonOff()
        }
        
    }
 
    @IBOutlet weak var settingsButtonOutlet: UIButton!
    @IBAction func settingsButtonAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var leaderboardsButtonOutlet: UIButton!
    @IBAction func leaderboardsButtonAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var removeAdsButtonOutlet: UIButton!
    @IBAction func removeAdsButtonAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var playButtonOutlet: UIButton!
    @IBAction func playButtonAction(_ sender: UIButton) {
        
    }

    //Function to animate play button and selected game button on the screen when a button is pressed
    func animatePlayButtonAndSelectedGameButtonOn(){
        activeButton = true
        //Animate GameLabel in from the from the right
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 3.0, initialSpringVelocity: 30.0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            self.selectedGameLabel.isHidden = false
            self.selectedGameLabel.center.x = self.selectedGameLabel.center.x - 1000
        }, completion: { (finished: Bool) in
            //print("Selected Game Label on screen Animation Completed")
        })
        
        //self.playButtonOutlet.setImage(UIImage(named: "playButton"), for: [])
        //Aniamte playButton in from the left
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 3.0, initialSpringVelocity: 30.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.playButtonOutlet.isHidden = false
            self.playButtonOutlet.center.x = self.playButtonOutlet.center.x + 1000
        }, completion: { (finished: Bool) in
            //print("Play Button on screen Animation Completed")
        })
    }
    
    //Function to animate play button and selected game button back off the screen when a button is pressed
    func animartePlayButtonAndSelectedGameButtonOff(){
        activeButton = false
        //Animate selectedGameLabel back off to the right
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.transitionCurlUp, animations: {
            self.selectedGameLabel.center.x = self.selectedGameLabel.center.x + 1000
        }, completion: { (finished: Bool) in
            //print("Selected Game Label off screen Animation Completed")
        })
        
        //self.playButtonOutlet.setImage(UIImage(named: "circle19"), for: [])
        //animate playButtonOutlet back off to the left
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
            self.playButtonOutlet.center.x = self.playButtonOutlet.center.x - 1000
            //print("Play Button Outlet Got here")
        }, completion: { (finished: Bool) in
            //print("Play Button off screen Animation Completed")
        })
    }
    
    
    //Main Menu Music
    open var mainMenuMusic: AVAudioPlayer? = {
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
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 3.0, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.swooshSound?.play()
            self.gameLabel.center.x = self.view.frame.width * 2.0
        }), completion: nil)
        
        //Animates 'Clash' in from the right
        clashLabel.center.x = self.view.frame.width + 200
        UIView.animate(withDuration: 0.5, delay: 1.0, usingSpringWithDamping: 3.0, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.swooshSound?.play()
            self.clashLabel.center.x = self.view.frame.width / 2.0
        }), completion: nil)
        
        //Animate Tic Tac Toe Button from the top
        ticTacToeButtonOutlet.center.y = self.view.frame.width - 500
        randomPlayButtonOutlet.center.y = self.view.frame.width + 2000
        UIView.animate(withDuration: 0.5, delay: 1.3, usingSpringWithDamping: 3.0, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.ticTacToeButtonOutlet.center.y = self.view.frame.width * 2.0
            self.randomPlayButtonOutlet.center.y = self.randomPlayButtonOutlet.center.y - 2000
        }), completion: nil)
        
        //Animates favorites and daily spend button in from the left and multiplayer button and store button in from the right
        favoritesButtonOutlet.center.x = favoritesButtonOutlet.center.x - 250
        multiPlayerButtonOutlet.center.x = multiPlayerButtonOutlet.center.x + 250
        dailySpendButtonOutlet.center.x = dailySpendButtonOutlet.center.x - 250
        storeButtonOutlet.center.x = storeButtonOutlet.center.x + 250
        UIView.animate(withDuration: 1.0, delay: 2.0, usingSpringWithDamping: 3.0, initialSpringVelocity: 20.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.favoritesButtonOutlet.center.x = self.favoritesButtonOutlet.center.x + 250
            self.multiPlayerButtonOutlet.center.x = self.multiPlayerButtonOutlet.center.x - 250
            self.dailySpendButtonOutlet.center.x = self.dailySpendButtonOutlet.center.x + 250
            self.storeButtonOutlet.center.x = self.storeButtonOutlet.center.x - 250
        }), completion: nil)
        
        //Animate the three buttons from the bottom
        settingsButtonOutlet.center.y = settingsButtonOutlet.center.y - 200
        leaderboardsButtonOutlet.center.y = leaderboardsButtonOutlet.center.y - 200
        removeAdsButtonOutlet.center.y = removeAdsButtonOutlet.center.y - 200
        UIView.animate(withDuration: 0.5, delay: 2.5, usingSpringWithDamping: 3.0, initialSpringVelocity: 15.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.settingsButtonOutlet.center.y = self.settingsButtonOutlet.center.y - 200
            self.leaderboardsButtonOutlet.center.y = self.leaderboardsButtonOutlet.center.y - 200
            self.removeAdsButtonOutlet.center.y = self.removeAdsButtonOutlet.center.y - 200
        }), completion: nil)
    }
    
    //Override Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        destination.transitioningDelegate = mainMenuToTicTacToeAnimator
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuMusic?.play()
        beginningAnimations()
        selectedGameLabel.isHidden = true
        playButtonOutlet.isHidden = true
        
        selectedGameLabel.center.x = selectedGameLabel.center.x + 1000
        playButtonOutlet.center.x = playButtonOutlet.center.x - 1000
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
