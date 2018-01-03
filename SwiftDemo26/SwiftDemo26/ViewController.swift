//
//  ViewController.swift
//  SwiftDemo26
//
//  Created by jiaoyu on 2018/1/3.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentOffset = CGPoint(x: self.view.frame.size.width, y: 0)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        
        let leftController = LeftViewController()
        let rightController = RightViewController()
        let centerController = CenterViewController()
        
        
        self.addChildViewController(leftController)
        self.addChildViewController(centerController)
        self.addChildViewController(rightController)
        
        scrollView.addSubview(leftController.view)
        leftController.view.frame.origin.x = 0
        
        scrollView.addSubview(centerController.view)
        centerController.view.frame.origin.x = self.view.frame.size.width
        
        scrollView.addSubview(rightController.view)
        rightController.view.frame.origin.x = self.view.frame.size.width * 2
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

