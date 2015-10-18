//
//  HomeController.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/17/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeController: UITableViewController {

    private var games = [
        ["id": 1, "invitorUserId": 2, "inviteeUserId": 1, "type": 0, "status": 0, "turn": 0, "lastWinner": 0, "invitorWinCount": 0, "inviteeWinCount": 0, "opponentName": "Billy Johnson", "opponentImage": "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtf1/v/t1.0-1/p160x160/11218517_10204636870097875_2288167644375633074_n.jpg?oh=9b93e71f19ea0e22b2625cd41f0ff57e&oe=56D2A1B9&__gda__=1456297007_0b55c93c4b8a5bb5aab80a475a482d02"],
        ["id": 2, "invitorUserId": 1, "inviteeUserId": 2, "type": 0, "status": 0, "turn": 0, "lastWinner": 0, "invitorWinCount": 0, "inviteeWinCount": 0, "opponentName": "Joe Smith", "opponentImage": "https://scontent-ord1-1.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/1463696_10201775299855850_1206157794_n.jpg?oh=1fa59e7e21ff6f95b678536d38f2621f&oe=569438B7"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true)
        self.automaticallyAdjustsScrollViewInsets = false;
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell") as! GameCell
        
        cell.opponentImageView.af_setImageWithURL(NSURL(string: games[indexPath.row]["opponentImage"] as! String)!, placeholderImage: UIImage(named: "Home"))
        cell.opponentNameLabel.text = games[indexPath.row]["opponentName"] as? String
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
        switch indexPath.row {
        case 0...1: return 35
        case 2...4: return 65
        case 5: return 100
        default: return 150
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
