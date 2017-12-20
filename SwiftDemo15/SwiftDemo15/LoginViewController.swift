//
//  LoginViewController.swift
//  SwiftDemo15
//
//  Created by jiaoyu on 2017/12/20.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        self.view.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userNameInput = UITextField(frame: CGRect(x: -270, y: 50, width: 270, height: 40))
        userNameInput.borderStyle = .roundedRect
        userNameInput.placeholder = "UserName"
        self.view.addSubview(userNameInput)
        
        let passwordInput = UITextField(frame: CGRect(x: -270, y: 100, width: 270, height: 40))
        passwordInput.borderStyle = .roundedRect
        passwordInput.placeholder = "Password"
        self.view.addSubview(passwordInput)
        
        let loginButton = UIButton(frame: CGRect(x: -125, y: 160, width: 125, height: 40))
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 22/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            userNameInput.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            passwordInput.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            loginButton.center.x = self.view.center.x
        }) { (isComplete) in
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
                loginButton.frame.size.width = 180
                loginButton.center.x = self.view.center.x
            }, completion: nil)
        }
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
