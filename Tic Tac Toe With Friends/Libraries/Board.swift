//
//  Board.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/24/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

protocol BoardProtocol {
    //func getBoardView(screenSize: CGRect) -> UIView
}

class Board {
    
    var game: Game
    var user: User
    var controller: UIViewController
    
    var numberOfRows: Int = 0
    var numberOfColumns: Int = 0
    
    var boardPadding: Int = 0
    var spacePadding: Int = 0
    var piecePadding: Int = 0
    
    var playerOnePhoto: String
    var playerTwoPhoto: String

    var spaceImageViews: [SpaceImageView] = []
    var spaceButtons: [SpaceButton] = []

    init() {
        self.game = Game()
        self.user = User()
        self.controller = UIViewController()
        
        self.playerOnePhoto = self.game.isPlayerOne ? self.user.photo : self.game.opponentPhoto
        self.playerTwoPhoto = !self.game.isPlayerOne ? self.user.photo : self.game.opponentPhoto
    }
    
    init(game: Game, user: User, controller: UIViewController) {
        self.game = game
        self.user = user
        self.controller = controller
        
        self.playerOnePhoto = self.game.isPlayerOne ? self.user.photo : self.game.opponentPhoto
        self.playerTwoPhoto = !self.game.isPlayerOne ? self.user.photo : self.game.opponentPhoto
    }
    
    func getBoardView(bounds: CGRect) -> UIView {
        let boundsWidth: Int = Int(bounds.width)
        let spaceSize: Int = (boundsWidth - (boardPadding * 2) - (spacePadding * (numberOfRows - 1))) / numberOfRows
        
        let view: UIView = UIView(frame: CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height))
        
        for var columnIndex = 1; columnIndex <= numberOfColumns; ++columnIndex {
            for var rowIndex = 1; rowIndex <= numberOfRows; ++rowIndex {
                let x: Int = boardPadding + (piecePadding * (columnIndex - 1)) + (spaceSize * (columnIndex - 1))
                let y: Int = boardPadding + (piecePadding * (rowIndex - 1)) + (spaceSize * (rowIndex - 1))
                let spaceBounds: CGRect = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(spaceSize), CGFloat(spaceSize))
                let pieceBounds: CGRect = CGRectMake(CGFloat(piecePadding), CGFloat(piecePadding), CGFloat(spaceSize - piecePadding * 2), CGFloat(spaceSize - piecePadding * 2))
                let buttonBounds: CGRect = CGRectMake(0, 0, CGFloat(spaceSize), CGFloat(spaceSize))
                //print("x:" + String(x) + " y:" + String(y))
                
                let spaceBackground: UIView = UIView(frame: spaceBounds)
                spaceBackground.backgroundColor = UIColor.ticTacToeBlueColor()
                spaceBackground.layer.cornerRadius = 5
                view.addSubview(spaceBackground)
                
                let imageView: SpaceImageView = SpaceImageView()
                imageView.frame = pieceBounds
                imageView.row = rowIndex
                imageView.column = columnIndex
                imageView.layer.cornerRadius = 5
                imageView.layer.masksToBounds = true
                imageView.contentMode = UIViewContentMode.ScaleAspectFill
                setSpaceImageView(imageView)
                spaceBackground.addSubview(imageView)
                spaceImageViews.append(imageView)
                
                let button: SpaceButton = SpaceButton()
                button.frame = buttonBounds
                button.row = rowIndex
                button.column = columnIndex
                setSpaceButton(button)
                spaceBackground.addSubview(button)
                spaceButtons.append(button)
            }
        }
        
        return view
    }
    
    func setSpaceImageView(imageView: SpaceImageView) {
        let spaceStatus: SpaceStatus = getSpaceStatus(imageView.row, column: imageView.column)

        switch spaceStatus {
            case .Unmarked:
                break
            case .PlayerOneMarked:
                imageView.af_setImageWithURL(NSURL(string: playerOnePhoto)!, placeholderImage: UIImage(named: "User"))
            case .PlayerTwoMarked:
                imageView.af_setImageWithURL(NSURL(string: playerTwoPhoto)!, placeholderImage: UIImage(named: "User"))
        }
    }
    
    func setSpaceButton(button: SpaceButton) {
        let spaceStatus: SpaceStatus = getSpaceStatus(button.row, column: button.column)
        
        button.removeTarget(nil, action: nil, forControlEvents: UIControlEvents.AllEvents)
        if (spaceStatus == .Unmarked) {
            button.addTarget(self.controller, action: Selector("spaceClicked:"), forControlEvents:.TouchUpInside)
        }
    }
    
    func getSpaceStatus(row: Int, column: Int) -> SpaceStatus {
        if(row == 1 && column == 1) { return SpaceStatus(rawValue: self.game.space1x1)! }
        if(row == 1 && column == 2) { return SpaceStatus(rawValue: self.game.space1x2)! }
        if(row == 1 && column == 3) { return SpaceStatus(rawValue: self.game.space1x3)! }
        if(row == 2 && column == 1) { return SpaceStatus(rawValue: self.game.space2x1)! }
        if(row == 2 && column == 2) { return SpaceStatus(rawValue: self.game.space2x2)! }
        if(row == 2 && column == 3) { return SpaceStatus(rawValue: self.game.space2x3)! }
        if(row == 3 && column == 1) { return SpaceStatus(rawValue: self.game.space3x1)! }
        if(row == 3 && column == 2) { return SpaceStatus(rawValue: self.game.space3x2)! }
        if(row == 3 && column == 3) { return SpaceStatus(rawValue: self.game.space3x3)! }
        return SpaceStatus(rawValue: 0)!
    }
    
    func refreshPieces(game: Game) {
        self.game = game
        for var columnIndex = 1; columnIndex <= numberOfColumns; ++columnIndex {
            for var rowIndex = 1; rowIndex <= numberOfRows; ++rowIndex {
                let imageView: SpaceImageView = getSpaceImageView(rowIndex, column: columnIndex)
                setSpaceImageView(imageView)
                let button: SpaceButton = getSpaceButton(rowIndex, column: columnIndex)
                setSpaceButton(button)
            }
        }
    }
    
    func getSpaceButton(row: Int, column: Int) -> SpaceButton {
        let results: [SpaceButton] = spaceButtons.filter { $0.row == row && $0.column == column }
        return results[0]
    }
    
    func getSpaceImageView(row: Int, column: Int) -> SpaceImageView {
        let results: [SpaceImageView] = spaceImageViews.filter { $0.row == row && $0.column == column }
        return results[0]
    }
}
