//
//  ViewController.swift
//  SwiftDemo13
//
//  Created by jiaoyu on 2017/12/15.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideoBackground()
    }
    func setupVideoBackground() {
        
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url as NSURL
        view.isUserInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

