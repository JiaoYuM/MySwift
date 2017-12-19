//
//  CustomButton.swift
//  SwiftDemo14
//
//  Created by jiaoyu on 2017/12/19.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

enum ButtonImagePosition : Int {
    case PositionTop = 0
    case PositionLeft
    case PositionBottom
    case PositionRight
}

extension UIButton {
    /*
     param imageName 图片名
     param title   button的名字
     param type     image的位置
     param space     图片文字之间的距离
     
     */
    func setImageAndTitle(imageName:String, title:String, type:ButtonImagePosition, space:CGFloat) {
        
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named:imageName), for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth : CGFloat = 0.0
        var labelHeight : CGFloat = 0.0
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width)
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height)
        
        
        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets()
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets()
        
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight - space/2.0, 0)
            break;
        case .PositionLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0)
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWidth, 0, 0)
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-space/2.0, 0, imageWidth+space/2.0)
            break;
        
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
