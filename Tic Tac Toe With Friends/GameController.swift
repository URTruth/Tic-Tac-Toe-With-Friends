//
//  GameController.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/24/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit
import Alamofire

class GameController: UIViewController {
    
    @IBOutlet var playerProfileImageView: UIImageView!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerWinsLabel: UILabel!
    @IBOutlet var opponentProfileImageView: UIImageView!
    @IBOutlet var opponentNameLabel: UILabel!
    @IBOutlet var opponentWinsLabel: UILabel!
    
    var gameId: Int = 0
    var board: Board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor.ticTacToeLightBlueColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.playerProfileImageView.af_setImageWithURL(NSURL(string: User.sharedInstance.photo)!, placeholderImage: UIImage(named: "User"))
        self.playerNameLabel.text = User.sharedInstance.name
        
        Alamofire.request(.GET, "http://www.wavelinkllc.com/tictactoewithfriends/get_game.php", parameters: ["gameId": gameId, "userId": User.sharedInstance.id])
            .responseJSON { response in
                if (response.result.isSuccess) {
                    if (response.result.value != nil) {
                        let game: Game3x3 = Game3x3.init(JSONData: response.result.value as! Dictionary<String, AnyObject>)
                        self.playerWinsLabel.text = String(game.playerWins)
                        self.opponentProfileImageView.af_setImageWithURL(NSURL(string: game.opponentPhoto)!, placeholderImage: UIImage(named: "User"))
                        self.opponentNameLabel.text = game.opponentName
                        self.opponentWinsLabel.text = String(game.opponentWins)
                        self.board = Board3x3(game: game, user: User.sharedInstance, controller: self)
                        let boardBounds: CGRect = CGRectMake(0, 200, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
                        self.view.addSubview(self.board.getBoardView(boardBounds))
                    } else {
                        // could not find game
                    }
                } else {
                    // network error
                }
        }
    }
    
    func spaceClicked(button: SpaceButton) {
        print("Space clicked - row: " + String(button.row) + " column:" + String(button.column))
        self.board.game.setSpace(button.row, column: button.column)
        /*
        Alamofire.request(.POST, "http://www.wavelinkllc.com/tictactoewithfriends/move.php", parameters: ["gameId": self.game.id, "gameStatus": ])
            .responseJSON { response in
                if (response.result.isSuccess) {
                    let data: Dictionary = (response.result.value as? Dictionary<String, AnyObject>)!
                    if (data["isAuthenticated"] as! String == "true") {
                        self.id = ""
                        self.name = ""
                        self.email = ""
                        self.phone = ""
                        self.photo = ""
                        self.facebookId = ""
                        self.twitterId = ""
                        self.digitsId = ""
                        self.wins = ""
                        self.isLoggedIn = false
                        self.keychain["userId"] = nil
                        completion(isSuccess: true)
                    } else {
                        completion(isSuccess: false)
                    }
                } else {
                    // network error
                    completion(isSuccess: false)
                }
        }
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
