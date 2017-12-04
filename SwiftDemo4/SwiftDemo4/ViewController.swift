//
//  ViewController.swift
//  SwiftDemo4
//
//  Created by jiaoyu on 2017/12/4.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextViewDelegate{
    
    var limitTextView:UITextView!
    var allowInputNumberLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.initInputField()
        self.initNavigationBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(note:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func initInputField() {
        
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = UIApplication.shared.statusBarFrame
        
        let avarImageview = UIImageView(frame: CGRect(x: 0, y: (naviFrame?.height)! + statusBarFrame.height + 10, width: 70, height: 70))
        avarImageview.image =  #imageLiteral(resourceName: "avatar.jpg")
        self.view.addSubview(avarImageview)
        
        limitTextView = UITextView(frame: CGRect(x: 80, y: avarImageview.frame.height, width: self.view.frame.width - 70 - 20, height: 300))
        self.view.addSubview(limitTextView)
        limitTextView.delegate = self
        limitTextView.font = UIFont.systemFont(ofSize: 20)
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 40, width: 50, height: 40))
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
        self.view.addSubview(allowInputNumberLabel)
        
    }

    @objc func initNavigationBar() {
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(title: "publish", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightItem
        rightItem.tintColor = UIColor.yellow
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let textviewCount = limitTextView.text.count
        if textviewCount >= 140 {
            limitTextView.resignFirstResponder()
        }
        
        allowInputNumberLabel.text = "\(140 - textviewCount)"
        
    }
    
    @objc func keyboardWillChangeFrame(note:Notification){
        let duration = note.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let frame = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let y = frame.origin.y
        
        let margin = UIScreen.main.bounds.height - y
        
        UIView.animate(withDuration: duration) {
            
            if margin > 0 {
                self.allowInputNumberLabel.frame.origin.y = self.allowInputNumberLabel.frame.origin.y - margin
                
            }else{
                self.allowInputNumberLabel.frame.origin.y = self.view.frame.height - 40

            }
            
        }
        
        
        
        
        
    }
    


}

