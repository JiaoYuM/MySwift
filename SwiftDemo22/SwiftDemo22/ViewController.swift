//
//  ViewController.swift
//  SwiftDemo22
//
//  Created by jiaoyu on 2017/12/27.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

public enum ViewControllerNavigationType:Int {
    case Present = 0
    case Dismiss = 1
}

class ViewController: UIViewController ,CustomTransitionDelegate,UIViewControllerTransitioningDelegate{
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    
    var transition = CustomTtanstion()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imagview = UIImageView(frame: self.view.frame)
        imagview.image = #imageLiteral(resourceName: "Photo")
        self.view.addSubview(imagview)
        
        let menuButtonBar = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(triggerMenu))
        self.navigationItem.leftBarButtonItem = menuButtonBar
    
    }
    
    @objc func triggerMenu(){
        let menuViewController = MenuViewController()
        menuViewController.transitioningDelegate = self;
        menuViewController.modalPresentationStyle = .custom
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = ViewControllerNavigationType.Dismiss
        return transition
    }

    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.delegate = self
        transition.navigationType = ViewControllerNavigationType.Present
        return transition
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

