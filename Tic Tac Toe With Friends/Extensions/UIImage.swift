//
//  UIImage.swift
//  Tic Tac Toe With Friends
//
//  Created by Kelvin Graddick on 10/17/15.
//  Copyright © 2015 Wave Link, LLC. All rights reserved.
//

import UIKit

extension UIImage {
    func resize (size:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
}
