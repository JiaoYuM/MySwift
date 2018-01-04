//
//  BeautyContestOverlayView.swift
//  SwiftDemo27
//
//  Created by jiaoyu on 2018/1/4.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit
import Koloda
private let overlayRightImageName = "overlay_like"
private let overlayLeftImageName = "overlay_skip"

class BeautyContestOverlayView: OverlayView {
    


    lazy var overlayImageview: UIImageView! = {
        [unowned self] in
        
        var imageview = UIImageView(frame: self.bounds)
        self.addSubview(imageview)
        
        return imageview
    }()
    

}
