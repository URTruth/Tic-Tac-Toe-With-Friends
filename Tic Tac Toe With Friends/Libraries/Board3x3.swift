//
//  Board3x3.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/25/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

class Board3x3: Board, BoardProtocol {
    
    override init(game: Game, user: User, controller: UIViewController) {
        super.init(game: game, user: user, controller: controller)
        
        numberOfRows = 3
        numberOfColumns = 3
        boardPadding = 16
        spacePadding = 16
        piecePadding = 16
    }
    
}