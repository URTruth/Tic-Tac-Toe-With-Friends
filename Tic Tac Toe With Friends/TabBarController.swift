//
//  TabBarController.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/17/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.ticTacToeDarkBlueColor()
        UITabBar.appearance().selectedImageTintColor = UIColor.whiteColor()
        UITabBar.appearance().barTintColor = UIColor.ticTacToeLightBlueColor()
        
        let offset:CGFloat = -1;
        let tabImage1 = (UIImage(named: "Home")?.resize(CGSizeMake(26 + offset, 26 + offset)))!
        
        let tabBarItem1 = tabBar.items![0] as UITabBarItem
        tabBarItem1.image = tabImage1
        
        //item2.imageInsets = UIEdgeInsetsMake(7, 0, -5, 0);
        //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:CHIIME_REGULAR_FONT size:9.5f], NSFontAttributeName, nil] forState:UIControlStateNormal];
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
