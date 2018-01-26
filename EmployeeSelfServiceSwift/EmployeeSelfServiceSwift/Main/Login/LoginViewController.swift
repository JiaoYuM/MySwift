//
//  LoginViewController.swift
//  EmployeeSelfServiceSwift
//
//  Created by jiaoyu on 2018/1/11.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class LoginViewController: BaseViewController , UITextFieldDelegate{
    var accountTextField: UITextField!
    var passwordTextField: UITextField!
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        creatSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

    //UI控件
    func creatSubviews()  {
        //logo
        let imageview = UIImageView()
        imageview.image = #imageLiteral(resourceName: "logo")
        self.view.addSubview(imageview)
        imageview.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(60)
            make.size.equalTo(CGSize(width: 120, height: 94.5))
            
        }
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        titleLabel.text = "医院高效运营管理系统"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view).offset(0)
            make.top.equalTo(imageview.snp.bottom).offset(10)
        }
        //帐号
        accountTextField = UITextField()
        accountTextField.borderStyle = UITextBorderStyle.roundedRect
        accountTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        accountTextField.layer.borderColor = UIColor.lightGray.cgColor
        accountTextField.delegate = self
        accountTextField.returnKeyType = UIReturnKeyType.done
        accountTextField.placeholder = "用户名"
        
        self.view.addSubview(accountTextField)
        accountTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(38)
        }
        
        //密码
        passwordTextField = UITextField()
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.placeholder = "密码"
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        self.view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(accountTextField.snp.bottom).offset(15)
            make.left.right.height.equalTo(accountTextField)
        }
        
        loginBtn = UIButton()
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.backgroundColor = UIColor.blue
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 3
        loginBtn.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.left.right.equalTo(passwordTextField)
            make.height.equalTo(44)
        }
        
        //选择网络
        let netChooseBtn = UIButton()
        netChooseBtn.setTitle("选择网络 >", for: UIControlState.normal)
        netChooseBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        netChooseBtn.titleLabel?.textAlignment = .right
        netChooseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(netChooseBtn)
        netChooseBtn.addTarget(self, action: #selector(chooseNetAction), for: UIControlEvents.touchUpInside)
        
        netChooseBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
            make.right.equalTo(loginBtn.snp.right).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }
        
        let identityLab = UILabel()
        identityLab.text = "北京东软望海科技有限公司"
        identityLab.textAlignment = .center
        identityLab.font = UIFont.systemFont(ofSize: 12.0)
        identityLab.textColor = UIColor.lightGray
        self.view.addSubview(identityLab)
        
        identityLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
        }
        
        let userDefault = UserDefaults.standard
        accountTextField.text = userDefault.value(forKey: "account") as? String
        passwordTextField.text = userDefault.value(forKey: "password") as? String
    }
    
    //MARK: -UITextFieldDelegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //登录
    @objc func loginAction() {
        self.view.endEditing(true)
        
        let userDefaults = UserDefaults.standard
        let ipStr = userDefaults.value(forKey: "ip") as? String
        
        let userName = accountTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces)

        if userName?.count == 0 {
            
            return
        }else if passwordTextField.text?.count == 0 {
            
            return
        }else if ipStr?.count == 0 {  //先设置网络
            let alertVC = UIAlertController(title: "提示", message: "请先配置网络,点击确定按钮直接进入配置网络页面", preferredStyle: UIAlertControllerStyle.alert)
            let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let done = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (_) in
                
                let netWorkVC = SetNetWorkController()
                self.navigationController?.pushViewController(netWorkVC, animated: true)
                
            })
            
            alertVC.addAction(cancel)
            alertVC.addAction(done)
            
            self.present(alertVC, animated: true, completion: nil)
        
            return
        }
        
        //如果用用户名上次登录的不一样 则重新选择账套单位
        let storeName = userDefaults.value(forKey: "account") as? String
        if storeName != userName {
            userDefaults.removeObject(forKey: "compName")
            userDefaults.removeObject(forKey: "compCode")
            userDefaults.removeObject(forKey: "copyName")
            userDefaults.removeObject(forKey: "copyCode")
        }
        
        let password = passwordTextField.text!
        let para = ["userName":userName!,"password":password,"module":"ctrl"] as [String : Any]
        
        let dataRequest = request("baidu.com", method: .post, parameters: para, encoding: URLEncoding.default, headers: nil)
        
        
        dataRequest.responseJSON { (response) in
            
        }
        
        
        
        
        
        
    }
    //跳转到网络设置
    @objc func chooseNetAction() {
        let networkVC = SetNetWorkController()
        self.navigationController?.pushViewController(networkVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
