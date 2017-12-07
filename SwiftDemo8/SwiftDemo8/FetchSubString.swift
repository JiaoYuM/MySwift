//
//  FetchSubString.swift
//  SwiftDemo8
//
//  Created by jiaoyu on 2017/12/7.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import Foundation
//截取字符串  string[startIndex..<endIndex]
extension String{
    subscript (r:Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}
