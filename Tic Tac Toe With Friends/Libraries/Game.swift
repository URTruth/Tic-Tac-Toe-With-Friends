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
    var size: Int = 3
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
    
}