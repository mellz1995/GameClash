//
//  TicTacFoe.swift
//  Game Clash
//
//  Created by Christopher Donelson on 1/3/17.
//  Copyright © 2017 Melvin Corners. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class TicTacFoe: SKScene {

    var positions: [SKSpriteNode] = []
    var playerTracker = 1
    var scoreTracker = 0
    var activeGame = true
    var winningLabel: SKLabelNode!
    var player1Score: SKLabelNode!
    var player2Score: SKLabelNode!
    var playAgain: SKLabelNode!
    
    // 0 = empty, 1 = naughts, 2 = crosses
    var gameState = [0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0]
    
    //tags on the board
    let board = [   [0,  1,  2,  3,  4,  5],
                    [6,  7,  8,  9,  10, 11],
                    [12, 13, 14, 15, 16, 17],
                    [18, 19, 20, 21, 22, 23],
                    [24, 25, 26, 27, 28, 29],
                    [30, 31, 32, 33, 34, 35] ];
    
    let winningCombinations = [ [0,  1,  2,  3],  [1,  2,  3,  4],  [2,  3,  4,  5],   //side by side wins
                                [6,  7,  8,  9],  [7,  8,  9,  10], [8,  9,  10, 11],
                                [12, 13, 14, 15], [13, 14, 15, 16], [14, 15, 16, 17],
                                [18, 19, 20, 21], [19, 20, 21, 22], [20, 21, 22, 23],
                                [24, 25, 26, 27], [25, 26, 27, 28], [26, 27, 28, 29],
                                [30, 31, 32, 33], [31, 32, 33, 34], [32, 33, 34, 35],
                                
                                [0, 6, 12, 18], [6, 12, 18, 24], [12, 18, 24, 30],      //straight down wins
                                [1, 7, 13, 19], [7, 13, 19, 25], [13, 19, 25, 31],
                                [2, 8, 14, 20], [8, 14, 20, 26], [14, 20, 26, 32],
                                [3, 9, 15, 21], [9, 15, 21, 27], [15, 21, 27, 33],
                                [4, 10, 16, 22], [10, 16, 22, 28], [16, 22, 28, 34],
                                [5, 11, 17, 23], [11, 17, 23, 29], [17, 23, 29, 35],
                                
                                [0, 7, 14, 21], [1, 8, 15, 22], [2, 9, 16, 23],         //backslash diagonal wins
                                [6, 13, 20, 27], [7, 14, 21, 28], [8, 15, 22, 29],
                                [12, 19, 26, 33], [13, 20, 27, 34], [14, 21, 28, 35],
                                
                                [3, 8, 13, 18], [4, 9, 14, 19], [5, 10, 15, 20],        //forwardslash diagonal wins
                                [9, 14, 19, 24], [10, 15, 20, 25], [11, 16, 21, 26],
                                [15, 20, 25, 30], [16, 21, 26, 31], [17, 22, 27, 32] ]

    
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        self.enumerateChildNodes(withName: "//row*") { (node, stop) in
            if let node = node as? SKSpriteNode{
                node.color = UIColor.clear
                self.positions.append(node)
            }
        }
        
        winningLabel = self.childNode(withName: "//winningLabel") as! SKLabelNode!
        winningLabel.isHidden = true
        
        playAgain = self.childNode(withName: "//playAgain") as! SKLabelNode!
        playAgain.isHidden = true
        
        player1Score = self.childNode(withName: "//player1Score") as! SKLabelNode!
        player2Score = self.childNode(withName: "//player2Score") as! SKLabelNode!
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            for i in 0 ..< positions.count {
                
                if positions[i].contains(touch.location(in: self)) && gameState[i] == 0 && activeGame == true {
                    
                    // Crosses turn
                    if playerTracker == 1 {
                        gameState[i] = playerTracker
                        positions[i].texture = SKTexture(imageNamed: "cross")
                        togglePlayer()
                        
                    }
                        
                    //Noughts turn
                    else {
                        gameState[i] = playerTracker
                        positions[i].texture = SKTexture(imageNamed: "nought")
                        togglePlayer()
                        
                    }
                }
                
                if playAgain.contains(touch.location(in: self)) && activeGame == false{
                    resetBoard()
                }
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func checkForWin(){
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] ==  gameState[combination[3]]{
                
                //We have a winner!
                activeGame = false
                winningLabel.text = "Player \(playerTracker) Wins"
                winningLabel.isHidden = false
                
                playAgain.isHidden = false
                
                updateScore()
                
            }
        }
    }
    
    func togglePlayer(){
        checkForWin()
        if playerTracker == 1 {
            playerTracker = 2
        } else {
            playerTracker = 1
        }
    }
    
    func updateScore(){
        if (playerTracker == 1) {
            scoreTracker = (Int(player1Score.text!))!
            scoreTracker += 1
            player1Score.text = "\(scoreTracker)"
        } else {
            scoreTracker = (Int(player2Score.text!))!
            scoreTracker += 1
            player2Score.text = "\(scoreTracker)"
        }
    }
    
    func resetBoard() {
        playerTracker = 1
        activeGame = true
        winningLabel.isHidden = true
        playAgain.isHidden = true
        activeGame = true
        
        for i in 0 ..< positions.count {
            positions[i].texture = SKTexture.init()
        }
        
        gameState = [0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0]
    }
    
    
    
    
    
}
