//
//  Game3x3.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 11/24/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import Foundation

class Game3x3: Game {

    override init() {
        super.init()
    }
    
    override init(JSONData: Dictionary<String, AnyObject>) {
        super.init(JSONData: JSONData)

        size = 3
    }
    
    internal func isWinningSelectedSpaces(playerNumber: PlayerNumber) -> Bool {
        if (space1x1 == playerNumber.rawValue && space1x2 == playerNumber.rawValue && space1x3 == playerNumber.rawValue) { return true }
        if (space2x1 == playerNumber.rawValue && space2x2 == playerNumber.rawValue && space2x3 == playerNumber.rawValue) { return true }
        if (space3x1 == playerNumber.rawValue && space3x2 == playerNumber.rawValue && space3x3 == playerNumber.rawValue) { return true }
        
        if (space1x1 == playerNumber.rawValue && space2x1 == playerNumber.rawValue && space3x1 == playerNumber.rawValue) { return true }
        if (space1x2 == playerNumber.rawValue && space2x2 == playerNumber.rawValue && space3x2 == playerNumber.rawValue) { return true }
        if (space1x3 == playerNumber.rawValue && space2x3 == playerNumber.rawValue && space3x3 == playerNumber.rawValue) { return true }
        
        if (space1x1 == playerNumber.rawValue && space2x2 == playerNumber.rawValue && space3x3 == playerNumber.rawValue) { return true }
        if (space1x3 == playerNumber.rawValue && space2x2 == playerNumber.rawValue && space3x1 == playerNumber.rawValue) { return true }
        
        return false;
    }
    
}
