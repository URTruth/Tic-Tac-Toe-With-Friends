//
//  GameCell.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/18/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet var opponentImageView: UIImageView!
    @IBOutlet var opponentNameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
