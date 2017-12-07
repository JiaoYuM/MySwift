//
//  ViewController.swift
//  SwiftDemo7
//
//  Created by jiaoyu on 2017/12/7.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    var imageview:UIImageView!
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageview = UIImageView(frame: self.view.bounds)
        imageview.image = UIImage(named: "samplePhoto.jpeg")
        imageview.isUserInteractionEnabled = true
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageview.bounds.size
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageview)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageview
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

