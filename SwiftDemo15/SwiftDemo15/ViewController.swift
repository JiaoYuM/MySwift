//
//  ViewController.swift
//  SwiftDemo15
//
//  Created by jiaoyu on 2017/12/20.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        
        let logoimageview = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoimageview.image = #imageLiteral(resourceName: "logo.png")
        self.view.addSubview(logoimageview)
        logoimageview.center.x = self.view.center.x
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: self.view.frame.size.height - buttonHeight, width: self.view.frame.size.width / 2.0, height: buttonHeight))
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("LOGIN IN", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        let signUpButton = UIButton(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.size.height - buttonHeight, width: self.view.frame.size.width / 2, height: buttonHeight))
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signUpButton.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(signUpButton)
        
    
    }

    
    @objc func loginAction() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

