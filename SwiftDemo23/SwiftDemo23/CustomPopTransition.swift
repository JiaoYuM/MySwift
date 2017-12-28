//
//  CustomPopTransition.swift
//  SwiftDemo23
//
//  Created by jiaoyu on 2017/12/28.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class CustomPopTransition: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! DetailViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let container = transitionContext.containerView
        
        let snapshotView = fromVC.bannerImageview.snapshotView(afterScreenUpdates: false)
        snapshotView?.frame = container.convert(fromVC.bannerImageview.frame, from: fromVC.view)
        fromVC.bannerImageview.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.selectedCell.imageView.isHidden = true
        
        container.insertSubview(toVC.view, belowSubview: fromVC.view)
        container.addSubview(snapshotView!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions(), animations: {
            snapshotView?.frame = container.convert(toVC.selectedCell.imageView.frame, from: toVC.selectedCell)
            fromVC.view.alpha = 0
            toVC.view.alpha = 1
        }) { (finish) in
            toVC.selectedCell.imageView.isHidden = false
            snapshotView?.removeFromSuperview()
            fromVC.bannerImageview.isHidden = false
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
