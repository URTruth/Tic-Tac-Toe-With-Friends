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

final class Game: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var id: Int
    var playerOneId: Int
    var playerTwoId: Int
    var type: Int
    var status: Int
    var playerOneWins: Int
    var playerTwoWins: Int
    var space1x1: Int?
    var space1x2: Int?
    var space1x3: Int?
    var space2x1: Int?
    var space2x2: Int?
    var space2x3: Int?
    var space3x1: Int?
    var space3x2: Int?
    var space3x3: Int?
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as! Int
        self.playerOneId = representation.valueForKeyPath("playerOneId") as! Int
        self.playerTwoId = representation.valueForKeyPath("playerTwoId") as! Int
        self.type = representation.valueForKeyPath("type") as! Int
        self.status = representation.valueForKeyPath("status") as! Int
        self.playerOneWins = representation.valueForKeyPath("playerOneWins") as! Int
        self.playerTwoWins = representation.valueForKeyPath("playerTwoWins") as! Int
        self.space1x1 = representation.valueForKeyPath("space1x1") as? Int
        self.space1x2 = representation.valueForKeyPath("space1x2") as? Int
        self.space1x3 = representation.valueForKeyPath("space1x3") as? Int
        self.space2x1 = representation.valueForKeyPath("space2x1") as? Int
        self.space2x2 = representation.valueForKeyPath("space2x2") as? Int
        self.space2x3 = representation.valueForKeyPath("space2x3") as? Int
        self.space3x1 = representation.valueForKeyPath("space3x1") as? Int
        self.space3x2 = representation.valueForKeyPath("space3x2") as? Int
        self.space3x3 = representation.valueForKeyPath("space3x3") as? Int
    }
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Game] {
        var games: [Game] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for gameRepresentation in representation {
                if let game = Game(response: response, representation: gameRepresentation) {
                    games.append(game)
                }
            }
        }
        
        return games
    }
    
}