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
    
    @IBOutlet var bottomButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var tugLength: CGFloat?

    override func viewDidLoad() {
        
        tugLength = self.view.frame.height / CGFloat( endingScore * 2 )
        bottomButtonHeight.constant = self.view.frame.height / 2
        
        let topButtonColor = UIColor(netHex: 0x53ccf7)
        let bottomButtonColor = UIColor(netHex: 0xec6559)
        let textColor = UIColor(netHex: 0xecf0f1)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame()

        topLabel.textColor = textColor
        bottomLabel.textColor = textColor
        topButton.backgroundColor = topButtonColor
        bottomButton.backgroundColor = bottomButtonColor
        topLabel.transform = CGAffineTransformMakeRotation(3.14)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func prefersStatusBarHidden () -> Bool {
        return true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // MARK Acitons
    
    @IBAction func topButtonAction(sender: AnyObject) {
        
        // decrease height of bottomButton for each topButton tap:
        bottomButtonHeight.constant -= tugLength!
        
        score += 1
        reloadScoreLabels()
        testScore()
    }
    
    @IBAction func bottomButtonAction(sender: AnyObject) {
        
        // increase height of bottomButton for each bottomButton tap:
        bottomButtonHeight.constant += tugLength!
        
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
        
        if score < 0 {
            topLabel.text = "\(score)"
            bottomLabel.text = "\(-score)"
        } else if score > 0 {
            topLabel.text = "\(score)"
            bottomLabel.text = "\(-score)"
        } else {
            topLabel.text = "\(score)"
            bottomLabel.text = "\(score)"
        }
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
        
        bottomButtonHeight.constant = self.view.frame.height / 2

        score = 0
        topLabel.text = "\(score)"
        bottomLabel.text = "\(score)"
    }

}

