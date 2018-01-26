//
//  BaseNavigationController.swift
//  EmployeeSelfServiceSwift
//
//  Created by jiaoyu on 2018/1/11.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏状态栏的颜色
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 17.0)]
        self.navigationBar.tintColor = UIColor.white
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-2*UIScreen.main.bounds.size.width, 0), for: .default)
        self.navigationBar.isTranslucent = false
        self.navigationBar.barStyle = UIBarStyle.black
        
        
        let image = #imageLiteral(resourceName: "navTitle")
        let leftCapWidth: Int = Int(image.size.width * 0.5)
        let topCapWidth: Int = Int(image.size.height * 0.5)
        
        let newImage = image.stretchableImage(withLeftCapWidth: leftCapWidth, topCapHeight: topCapWidth)
        self.navigationBar.setBackgroundImage(newImage, for: .default)
        
        self.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.done, target: self, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
    @objc func back() {
        super.popViewController(animated: true)
    }

}
