//
//  UIColor+ExtensionHelper.swift
//  CustomSearchBar
//
//  Created by Amr AlGhadban on 2/8/17.
//  Copyright © 2017 Arooba inc. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    
    class func color(_ hexString: String) -> UIColor? {
        if (hexString.characters.count > 7 || hexString.characters.count < 7) {
            return nil
        } else {
            let hexInt = Int(hexString.substring(from: hexString.characters.index(hexString.startIndex, offsetBy: 1)), radix: 16)
            if let hex = hexInt {
                let components = (
                    R: CGFloat((hex >> 16) & 0xff) / 255,
                    G: CGFloat((hex >> 08) & 0xff) / 255,
                    B: CGFloat((hex >> 00) & 0xff) / 255
                )
                return UIColor(red: components.R, green: components.G, blue: components.B, alpha: 1)
            } else {
                return nil
            }
        }
    }

}
