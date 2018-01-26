//
//  BaseViewController.swift
//  EmployeeSelfServiceSwift
//
//  Created by jiaoyu on 2018/1/11.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {

        print("deinit ------- \(type(of: self))")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
