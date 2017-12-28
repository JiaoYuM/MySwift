//
//  CustomTtanstion.swift
//  SwiftDemo22
//
//  Created by jiaoyu on 2017/12/27.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
@objc protocol CustomTransitionDelegate {
    func dismiss()
}
class CustomTtanstion: NSObject ,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromController = transitionContext.viewController(forKey: .from)
        let toController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        let fromView = fromController?.view
        let toView = toController?.view
        
        if navigationType == ViewControllerNavigationType.Present{
            fromView?.transform = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform = CGAffineTransform(translationX: 0, y: -50)
            snapShot = (fromView?.snapshotView(afterScreenUpdates: true))
            containerView.addSubview(toView!)
            containerView.addSubview(snapShot)
            let tapGesture = UITapGestureRecognizer(target: delegate, action: #selector(CustomTransitionDelegate.dismiss))
            snapShot.addGestureRecognizer(tapGesture)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.snapShot.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height - 150)
                toView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                transitionContext.completeTransition(true)
                fromController?.endAppearanceTransition()
                toController?.endAppearanceTransition()
            })
            
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                self.snapShot.transform = CGAffineTransform.identity
                fromView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                self.snapShot.removeFromSuperview()
                transitionContext.completeTransition(true)
                fromController?.endAppearanceTransition()
                toController?.endAppearanceTransition()
            })
            
        }
        
    }
    

    public var delegate:CustomTransitionDelegate!
    public var navigationType: ViewControllerNavigationType!
    private var snapShot : UIView!
}

