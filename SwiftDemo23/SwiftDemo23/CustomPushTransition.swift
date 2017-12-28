//
//  CustomPushTransition.swift
//  SwiftDemo23
//
//  Created by jiaoyu on 2017/12/28.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class CustomPushTransition: NSObject ,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! DetailViewController
        let container = transitionContext.containerView
        
        let snapshotView = fromVC.selectedCell.imageView.snapshotView(afterScreenUpdates: false)
        
        snapshotView?.frame = container.convert(fromVC.selectedCell.imageView.frame, from: fromVC.selectedCell)
        
        fromVC.selectedCell.imageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
        
        container.addSubview(toVC.view)
        container.addSubview(snapshotView!)
        toVC.bannerImageview.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions(), animations: {
            snapshotView?.frame = toVC.bannerImageview.frame
            fromVC.view.alpha = 0
            toVC.view.alpha = 1
        }) { (finish) in
            snapshotView?.frame = toVC.bannerImageview.frame
            fromVC.selectedCell.imageView.isHidden = false
            toVC.bannerImageview.image = toVC.img
            snapshotView?.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        }
        
        
    }
    
}
