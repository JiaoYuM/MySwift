//
//  ViewController.swift
//  SwiftPractice
//
//  Created by jiaoyu on 2017/11/30.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///s
        label.text = "king of the world"
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 30)
        label.frame = CGRect(x: 0, y: 100, width: 375, height: 30)
        
        let changeBtn = UIButton(type: UIButtonType.custom)
        changeBtn.frame = CGRect(x: 0, y: 400, width: 200, height: 30)
        changeBtn.setTitle("Change font family", for: UIControlState.normal)
        changeBtn.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        changeBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        
        printAllSupportedFontNames()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeFontFamily() {
        label.font = UIFont(name: "Savoye LET", size: 30)
    }
    
    func printAllSupportedFontNames()  {
        let famliyNames = UIFont.familyNames
        for familyName in famliyNames {
            print("\(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            
            for fontName in fontNames {
                print("-----\(fontName)")
            }
            
        }
        
    }
    
}

