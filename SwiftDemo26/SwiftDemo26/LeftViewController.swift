//
//  LeftViewController.swift
//  SwiftDemo26
//
//  Created by jiaoyu on 2018/1/3.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageview = UIImageView(frame: self.view.frame)
        imageview.image = #imageLiteral(resourceName: "leftSnap")
        self.view.addSubview(imageview)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
