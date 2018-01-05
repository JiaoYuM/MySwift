//
//  SpeakViewController.swift
//  SwiftDemo28
//
//  Created by jiaoyu on 2018/1/4.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class SpeakViewController: UIViewController {

    
    var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        
        
        dismissButton = UIButton(type: .custom)
        dismissButton.frame.size = CGSize(width: 70, height: 70)
        dismissButton.center.x = self.view.center.x
        dismissButton.frame.origin.y = self.view.frame.height - 250
        self.view.addSubview(dismissButton)
        dismissButton.backgroundColor = UIColor.red
        dismissButton.layer.masksToBounds = true
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        dismissButton.layer.shadowColor = UIColor.black.cgColor
        dismissButton.setImage(#imageLiteral(resourceName: "loading"), for: .normal)
        self.view.addSubview(dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        let leftImageview = UIImageView()
        leftImageview.image = #imageLiteral(resourceName: "close")
        leftImageview.frame = CGRect(x: 22, y: self.view.frame.height-22-25, width: 25, height: 25)
        self.view.addSubview(leftImageview)
        
        let rightImageview = UIImageView()
        rightImageview.image = #imageLiteral(resourceName: "earth")
        rightImageview.frame = CGRect(x: self.view.frame.width - 22 - 25, y: self.view.frame.height - 22 - 25, width: 25, height: 25)
        self.view.addSubview(rightImageview)
        
        let resultLabel = UILabel()
        resultLabel.frame.origin = CGPoint(x: 35, y: 35)
        resultLabel.text = "Speak Now"
        resultLabel.font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(resultLabel)
        resultLabel.sizeToFit()
        resultLabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        
        

    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true, completion: nil)
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
