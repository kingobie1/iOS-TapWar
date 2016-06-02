//
//  GameOverViewController.swift
//  TapWar
//
//  Created by Obatola Seward-Evans on 6/1/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var gameData: GameData?

    override func viewDidLoad() {
        let winButtonColor = UIColor(netHex: 0xaad568)
        let loseButtonColor = UIColor(netHex: 0xe84b4e)
        let playAgainButtonColor = UIColor(netHex: 0xecf0f1)
        let textColor = UIColor(netHex: 0x515151)
        
        super.viewDidLoad()
        
        topLabel.transform = CGAffineTransformMakeRotation(3.14)
        
        print(gameData?.loser)

        if gameData?.winner == Players.Top {
            // Top is the winner.
            
            topLabel.text = "Winner"
            bottomLabel.text = "Loser"
            topButton.backgroundColor = winButtonColor
            bottomButton.backgroundColor = loseButtonColor
            
        } else {
            // Bottom is the winner.
            
            topLabel.text = "Loser"
            bottomLabel.text = "Winner"
            topButton.backgroundColor = loseButtonColor
            bottomButton.backgroundColor = winButtonColor
        }
        
        playAgainButton.backgroundColor = playAgainButtonColor
        playAgainButton.setTitleColor(textColor, forState: UIControlState.Normal)
        topLabel.textColor = playAgainButtonColor
        bottomLabel.textColor = playAgainButtonColor
        
        
        let playBounds:CGFloat = playAgainButton.bounds.height / 2
        playAgainButton.contentEdgeInsets.left = 10
        playAgainButton.contentEdgeInsets.right = 10
        playAgainButton.frame = CGRectMake(0, 0, playBounds, playBounds)
        playAgainButton.layer.cornerRadius = playAgainButton.bounds.height
//        playAgainButton.clipsToBounds = true
    }
    
    // MARK: Actions.
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        // unwind
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mainViewController = segue.destinationViewController as! MainGameViewController
        mainViewController.resetGame()
    }
    

}
