//
//  ViewController.swift
//  SwiftDemo28
//
//  Created by jiaoyu on 2018/1/4.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIViewControllerTransitioningDelegate{
    var transition = BubbleTransition()
    var triggerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        
        let leftImgView = UIImageView(frame: CGRect(x: 22, y: 22, width: 25, height: 25))
        leftImgView.image = #imageLiteral(resourceName: "setting")
        self.view.addSubview(leftImgView)
        
        let rightImgView = UIImageView(frame: CGRect(x: (self.view.frame.size.width - 22 - 25), y: 22, width: 25, height: 25))
        rightImgView.image = #imageLiteral(resourceName: "window")
        self.view.addSubview(rightImgView)
        
        let signlabel = UILabel()
        signlabel.text = "SIGN IN"
        signlabel.font = UIFont.systemFont(ofSize: 20)
        signlabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        self.view.addSubview(signlabel)
        signlabel.sizeToFit()
        signlabel.center.x = self.view.center.x
        signlabel.frame.origin.y = 22
        
        let logoImageview = UIImageView()
        logoImageview.image = #imageLiteral(resourceName: "google_logo")
        logoImageview.frame.size = CGSize(width: 170, height: 71)
        logoImageview.center.x = self.view.center.x
        logoImageview.center.y = self.view.center.y - 71 - 50
        self.view.addSubview(logoImageview)
        //输入框
        let inputView = UITextField()
        inputView.frame.size = CGSize(width: self.view.frame.size.width - 60, height: 50)
        inputView.center.x = self.view.center.x
        inputView.center.y = self.view.center.y - 20
        inputView.borderStyle = .none
        inputView.layer.borderColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1).cgColor
        inputView.backgroundColor = UIColor.white
        inputView.layer.borderWidth = 1
        self.view.addSubview(inputView)
        
        //录音按钮
        triggerButton = UIButton(type: .custom)
        triggerButton.frame.size = CGSize(width: 70, height: 70)
        triggerButton.center.x = self.view.center.x
        triggerButton.frame.origin.y = inputView.frame.maxY + 40
        triggerButton.setImage(#imageLiteral(resourceName: "speaking"), for: .normal)
        triggerButton.backgroundColor = UIColor.white
        triggerButton.layer.masksToBounds = true
        triggerButton.layer.cornerRadius = triggerButton.frame.size.width / 2
        triggerButton.layer.shadowColor = UIColor.black.cgColor
        self.view.addSubview(triggerButton)
        triggerButton.addTarget(self, action: #selector(speaking(sender:)), for: .touchUpInside)
        
        
    }
    
    
    @objc func speaking(sender:UIButton!)  {
        let speakController = SpeakViewController()
        speakController.transitioningDelegate = self
        speakController.modalPresentationStyle = .custom
        self.navigationController?.present(speakController, animated: true, completion: nil)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startPoint = triggerButton.center
        transition.bubbleColor = triggerButton.backgroundColor!
        transition.duration = 0.4
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .dismiss {
                let dissmissVC = dismissed as! SpeakViewController
                dissmissVC.dismissButton.frame.origin.y = self.view.frame.height - 250
                
            }
            
        }
        return transition
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startPoint = triggerButton.center
        transition.bubbleColor = UIColor.white
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .present {
                let targetVC = presented as! SpeakViewController
                targetVC.dismissButton.frame.origin.y = self.view.frame.height - 150
                
            }
        }
        
        transition.duration = 0.4
        return transition
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

