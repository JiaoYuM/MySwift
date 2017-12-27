//
//  ViewController.swift
//  SwiftDemo21
//
//  Created by jiaoyu on 2017/12/27.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageview = UIImageView(frame: self.view.frame)
        imageview.image = #imageLiteral(resourceName: "viewcontroller")
        self.view.addSubview(imageview)
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }

}

