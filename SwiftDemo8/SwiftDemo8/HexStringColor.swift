//
//  HexStringColor.swift
//  SwiftDemo8
//
//  Created by jiaoyu on 2017/12/7.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import Foundation

extension String{
    func toUIColor() -> UIColor {
        guard (self.hasPrefix("#") && self.count == 7) || (self.hasPrefix("0x") && self.count == 8) || self.count == 6 else {
                return UIColor.red
        }
        
        var origin = self
        
        if (self.hasPrefix("#")) {
            origin = origin[1..<origin.count]
        }else if (self.hasPrefix("0x")) {
            origin = origin[2..<origin.count]
        }
        
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        Scanner(string: origin[0..<2]).scanHexInt32(&red)
        Scanner(string: origin[2..<4]).scanHexInt32(&green)
        Scanner(string: origin[4..<6]).scanHexInt32(&blue)
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    
    }
}
