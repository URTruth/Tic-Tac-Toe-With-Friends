//
//  Game.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/18/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import Foundation

enum GameStatus: Int {
    case Unaccepted = 0
    case PlayerOneTurn
    case PlayerTwoTurn
    case PlayerOneWon
    case PlayerTwoWon
}

enum PlayerNumber: Int {
    case One = 1
    case Two
}

enum SpaceStatus: Int {
    case Unmarked = 0
    case PlayerOneMarked
    case PlayerTwoMarked
}

class Game: NSObject {
    
    var id: Int = 0
    var opponentId: Int = 0
    var opponentName: String = ""
    var opponentPhoto: String = ""
    var size: Int = 0
    var status: Int = 0
    var playerWins: Int = 0
    var opponentWins: Int = 0
    var isPlayerOne: Bool = false
    var space1x1: Int = 0
    var space1x2: Int = 0
    var space1x3: Int = 0
    var space2x1: Int = 0
    var space2x2: Int = 0
    var space2x3: Int = 0
    var space3x1: Int = 0
    var space3x2: Int = 0
    var space3x3: Int = 0
    
    override init() {
        super.init()
    }
    
    init(JSONData: Dictionary<String, AnyObject>) {
        super.init()
        self.setValuesForKeysWithDictionary(JSONData)
    }
    
    internal func setSpace(row: Int, column: Int) {
        let status: SpaceStatus = self.isPlayerOne ? SpaceStatus.PlayerOneMarked : SpaceStatus.PlayerTwoMarked
        if(row == 1 && column == 1) { self.space1x1 = status.rawValue }
        if(row == 1 && column == 2) { self.space1x2 = status.rawValue }
        if(row == 1 && column == 3) { self.space1x3 = status.rawValue }
        if(row == 2 && column == 1) { self.space2x1 = status.rawValue }
        if(row == 2 && column == 2) { self.space2x2 = status.rawValue }
        if(row == 2 && column == 3) { self.space2x3 = status.rawValue }
        if(row == 3 && column == 1) { self.space3x1 = status.rawValue }
        if(row == 3 && column == 2) { self.space3x2 = status.rawValue }
        if(row == 3 && column == 3) { self.space3x3 = status.rawValue }
    }
    
}