//
//  GHColorEx.swift
//  GHLiaoTian
//
//  Created by 刘高晖 on 2016/12/2.
//  Copyright © 2016年 killer. All rights reserved.
//

import UIKit

extension UIColor
{
    convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    
    convenience init?(hexString: String, alpha: Float) {
        var hex = hexString
        
        if hex.hasPrefix("#") {
            hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 1))
        }
            if hex.lengthOfBytes(using: .utf8) == 3{
                
                let redHex = hex.substring(to: hex.index(hex.startIndex, offsetBy: 1))
                
                let range = Range(hex.index(hex.startIndex, offsetBy: 1)..<hex.index(hex.startIndex, offsetBy: 2))
                
                let greenHex = hex.substring(with: range)
                let blueHex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
                
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
        let redHex = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
        
        let greenHex = hex.substring(with: Range(hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)))
        
        let blueHex = hex.substring(with: Range(hex.index(hex.startIndex, offsetBy: 4)..<hex.index(hex.startIndex, offsetBy: 6)))
            var redInt:   CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt:  CUnsignedInt = 0
            
            Scanner(string: redHex).scanHexInt32(&redInt)
            Scanner(string: greenHex).scanHexInt32(&greenInt)
            Scanner(string: blueHex).scanHexInt32(&blueInt)

            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }
    
    
    convenience init?(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    
    convenience init?(hex: Int, alpha: Float) {
        let hexString = NSString(format: "%2X", hex)
        self.init(hexString: hexString as String, alpha: alpha)
    }

    
}
