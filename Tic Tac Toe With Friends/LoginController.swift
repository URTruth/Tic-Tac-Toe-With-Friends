//
//  LoginController.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/16/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit
import DigitsKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInWithDigits(sender: UIButton) {
        let appearance = DGTAppearance()
        appearance.backgroundColor = UIColor.ticTacToeLightBlueColor()
        appearance.accentColor = UIColor.ticTacToeDarkBlueColor()
        
        Digits.sharedInstance().authenticateWithDigitsAppearance(appearance, viewController: nil, title: nil) { (session, error) in
            if session != nil {
                print(session.phoneNumber)
                print(session.userID)
                self.performSegueWithIdentifier("homeSegue", sender: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
