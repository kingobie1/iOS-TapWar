//
//  GameData.swift
//  TapWar
//
//  Created by Obatola Seward-Evans on 6/1/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

enum Players {
    case Top, Bottom
}

class GameData {
    
    // MARK: Properties
    
    var winner: Players
    var loser: Players
    
    
    // MARK: Initializer
    
    init?(winner: Players, loser: Players){
        self.winner = winner
        self.loser = loser
        
        if winner == loser {
            return nil
        }
    }
}
