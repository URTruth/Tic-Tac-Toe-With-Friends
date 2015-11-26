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
    
    internal override func didPlayerWin(playerNumber: PlayerNumber) -> Bool {
        if (self.space1x1 == playerNumber.rawValue && self.space1x2 == playerNumber.rawValue && self.space1x3 == playerNumber.rawValue) { return true }
        if (self.space2x1 == playerNumber.rawValue && self.space2x2 == playerNumber.rawValue && self.space2x3 == playerNumber.rawValue) { return true }
        if (self.space3x1 == playerNumber.rawValue && self.space3x2 == playerNumber.rawValue && self.space3x3 == playerNumber.rawValue) { return true }
        
        if (self.space1x1 == playerNumber.rawValue && self.space2x1 == playerNumber.rawValue && self.space3x1 == playerNumber.rawValue) { return true }
        if (self.space1x2 == playerNumber.rawValue && self.space2x2 == playerNumber.rawValue && self.space3x2 == playerNumber.rawValue) { return true }
        if (self.space1x3 == playerNumber.rawValue && self.space2x3 == playerNumber.rawValue && self.space3x3 == playerNumber.rawValue) { return true }
        
        if (self.space1x1 == playerNumber.rawValue && self.space2x2 == playerNumber.rawValue && self.space3x3 == playerNumber.rawValue) { return true }
        if (self.space1x3 == playerNumber.rawValue && self.space2x2 == playerNumber.rawValue && self.space3x1 == playerNumber.rawValue) { return true }
        
        return false;
    }
    
    internal override func isDraw() -> Bool {
        if(!didPlayerWin(PlayerNumber.One) &&
           !didPlayerWin(PlayerNumber.Two) &&
           self.space1x1 != SpaceStatus.Unmarked.rawValue &&
           self.space2x1 != SpaceStatus.Unmarked.rawValue &&
           self.space3x1 != SpaceStatus.Unmarked.rawValue &&
           self.space1x2 != SpaceStatus.Unmarked.rawValue &&
           self.space2x2 != SpaceStatus.Unmarked.rawValue &&
           self.space3x2 != SpaceStatus.Unmarked.rawValue &&
           self.space1x3 != SpaceStatus.Unmarked.rawValue &&
           self.space2x3 != SpaceStatus.Unmarked.rawValue &&
           self.space3x3 != SpaceStatus.Unmarked.rawValue)
        {
            return true;
        }
        return false;
    }
    
}
