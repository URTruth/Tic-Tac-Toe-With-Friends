//
//  SpaceButton.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/24/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

class SpaceButton: UIButton {

    var row: Int = 0
    var column: Int = 0
   
    override init(frame: CGRect ) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
