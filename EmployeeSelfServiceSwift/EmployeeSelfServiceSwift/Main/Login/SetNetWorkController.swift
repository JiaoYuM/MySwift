//
//  SetNetWorkController.swift
//  EmployeeSelfServiceSwift
//
//  Created by jiaoyu on 2018/1/12.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit
import Alamofire

class SetNetWorkController: BaseViewController,UITextFieldDelegate {
    
    var ipTextField: UITextField!
    var portTextField: UITextField!
    var rootTextField: UITextField!
    var segment: UISegmentedControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "网络配置"
        self.view.backgroundColor = UIColor.white
        createSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -UI
    func createSubviews() {
        let array = ["http://","https://"]
        segment = UISegmentedControl(items: array)
        segment.selectedSegmentIndex = 0
        segment.isMomentary = false
        segment.tintColor = UIColor.blue
        segment.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15.0),NSAttributedStringKey.foregroundColor:UIColor.blue], for: UIControlState.normal)
        segment.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15.0),NSAttributedStringKey.foregroundColor:UIColor.white], for: UIControlState.selected)
        segment.addTarget(self, action: #selector(selectSegmentIndex), for: UIControlEvents.touchUpInside)
        self.view.addSubview(segment)
        
        ipTextField = UITextField()
        ipTextField.borderStyle = UITextBorderStyle.roundedRect
        ipTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        ipTextField.font = UIFont.systemFont(ofSize: 15.0)
        ipTextField.placeholder = "IP地址"
        self.view.addSubview(ipTextField)
        ipTextField.delegate = self
        ipTextField.returnKeyType = UIReturnKeyType.done
        
        portTextField = UITextField()
        portTextField.borderStyle = UITextBorderStyle.roundedRect
        portTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        portTextField.font = UIFont.systemFont(ofSize: 15.0)
        portTextField.placeholder = "端口号"
        self.view.addSubview(portTextField)
        portTextField.delegate = self
        portTextField.returnKeyType = UIReturnKeyType.done
        
        rootTextField = UITextField()
        rootTextField.borderStyle = UITextBorderStyle.roundedRect
        rootTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        rootTextField.font = UIFont.systemFont(ofSize: 15.0)
        rootTextField.placeholder = "根目录"
        self.view.addSubview(rootTextField)
        rootTextField.delegate = self
        rootTextField.returnKeyType = UIReturnKeyType.done
        
        let doneBtn = UIButton(type: .custom)
        doneBtn.layer.masksToBounds = true
        doneBtn.layer.cornerRadius = 3
        doneBtn.setTitle("保存", for: UIControlState.normal)
        doneBtn.backgroundColor = UIColor.blue
        self.view.addSubview(doneBtn)
        doneBtn.addTarget(self, action: #selector(saveIPAndPort), for: UIControlEvents.touchUpInside)
        
        
        segment.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(15)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        ipTextField.snp.makeConstraints { (make) in
            make.top.equalTo(segment.snp.bottom).offset(15)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.height.equalTo(38)
        }
        
        portTextField.snp.makeConstraints { (make) in
            make.top.equalTo(ipTextField.snp.bottom).offset(10)
            make.left.right.equalTo(ipTextField)
            make.height.equalTo(38)
        }
        
        rootTextField.snp.makeConstraints { (make) in
            make.top.equalTo(portTextField.snp.bottom).offset(10)
            make.left.right.equalTo(portTextField)
            make.height.equalTo(38)
        }
        
        doneBtn.snp.makeConstraints { (make) in
            make.top.equalTo(rootTextField.snp.bottom).offset(25)
            make.left.right.equalTo(rootTextField)
            make.height.equalTo(44)
        }
        
        let userDefaults = UserDefaults.standard
        let ipStr = userDefaults.value(forKey: "ip") as? String
        let ipString :String! = ipStr ?? ""
        
        if ipString.count > 0{
            ipTextField.text = userDefaults.object(forKey: "ip") as? String
        }else{
            if segment.selectedSegmentIndex == 0 {
                ipTextField.text = "http://"
            }else{
                ipTextField.text = "https://"
            }
        }
        
        portTextField.text = userDefaults.value(forKey: "port") as? String
        rootTextField.text = userDefaults.value(forKey: "root") as? String
    }
    
    //选择器方法
    @objc func selectSegmentIndex() {
        let index = segment.selectedSegmentIndex
        let userdefaults = UserDefaults.standard
        let str = index == 0 ? "http://" : "https://"
        let ip = userdefaults.value(forKey: "ip") as! String
        
        if ip.count > 0 {
            let array = ip.components(separatedBy: "://")
            let ipStr = array[1]
            ipTextField.text = "\(str)\(ipStr)"
        }else{
            ipTextField.text = str
        }
        
    }
    
    //保存按钮方法
    @objc func saveIPAndPort() {
        let regex = "((http|https)://)(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\\&%_\\./-~-]*)?"
        let predicate = NSPredicate(format: "SELF MATCHES \(regex)")
        if predicate.evaluate(with: ipTextField.text) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(ipTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines), forKey: "ip")
            
            var port = portTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespaces)
            if port?.count == 0{
                port = "80"
            }
            
            userDefaults.set(port, forKey: "port")
            userDefaults.set(rootTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespaces), forKey: "root")
            let delay = DispatchTime.now() + .seconds(60)
            DispatchQueue.main.asyncAfter(deadline: delay) {
                self.navigationController?.popViewController(animated: true)
            }
            
        }else{
            
        }
        
        
    }
    
    //MARK: -TextfieldDeledate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    

}
