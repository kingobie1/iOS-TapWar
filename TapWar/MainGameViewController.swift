//
//  MainGameViewController.swift
//  TapWar
//
//  Created by Obatola Seward-Evans on 6/1/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {
    
    // MARK Properties
    
    /// The score in which the game ends on.
    let endingScore = 10
    var score = 0
    var gameData: GameData?
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet var BottomButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var bottomButtonHeightChunk: CGFloat?

    override func viewDidLoad() {
        
        let topButtonColor = UIColor(netHex: 0x53ccf7)
        let bottomButtonColor = UIColor(netHex: 0xec6559)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame()
        
        topButton.backgroundColor = topButtonColor
        bottomButton.backgroundColor = bottomButtonColor
        topLabel.transform = CGAffineTransformMakeRotation(3.14)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK Acitons
    
    @IBAction func topButtonAction(sender: AnyObject) {
        
        score += 1
        
        reloadScoreLabels()
        testScore()
    }
    
    @IBAction func bottomButtonAction(sender: AnyObject) {
        
        score -= 1
        reloadScoreLabels()
        testScore()
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let gameOverScreen = segue.destinationViewController as! GameOverViewController
        gameOverScreen.gameData = self.gameData
    }
    
    
    // MARK: Helper Functions
    
    func reloadScoreLabels() {
        topLabel.text = "\(score)"
        bottomLabel.text = "\(score)"
    }
    
    func testScore() {
        
        // Game over
        if score >= endingScore {
            // Top Wins
            
            gameData = GameData.init(winner: Players.Top, loser: Players.Bottom)
            print("topWins")
            
        } else if score <= -endingScore {
            // Bottom Wins
            
            gameData = GameData.init(winner: Players.Bottom, loser: Players.Top)
            print("bottomWins")
            
        } else {
            return
        }
        
        performSegueWithIdentifier("toGameOver", sender: nil)
    }
    
    func resetGame() {
        print("Game Reset")
        
        score = 0
        topLabel.text = "\(score)"
        bottomLabel.text = "\(score)"
    }

}

