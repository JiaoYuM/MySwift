//
//  TextviewModel.swift
//  SwiftMVVM
//
//  Created by jiaoyu on 2018/1/9.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class TextviewModel: NSObject {
    var textModel: TextModel!
    
    @objc dynamic var color: UIColor?
    
    override init() {
        super.init()
        
        textModel = TextModel()
        textModel.addObserver(self, forKeyPath: "color", options: [.old,.new], context: nil)
    }
    
    
    //模拟请求网络数据
    public func reloadData() {
        textModel.requestData()
        
    }
    
    deinit {
        textModel.removeObserver(self, forKeyPath: "color")
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "color"{
            
            color = textModel.color
        }
    }
    
}


class TextModel: NSObject {
    @objc dynamic var color: UIColor?
    
    func requestData() {
        let red = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let green = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let colorRun = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        color = colorRun
      
    }
    
}
