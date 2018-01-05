//
//  BubbleTransition.swift
//  SwiftDemo28
//
//  Created by jiaoyu on 2018/1/4.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

open class BubbleTransition: NSObject {

    
    open var duration = 0.5
    
    open var bubbleColor: UIColor = .white
    
    open fileprivate(set) var bubble = UIView()
    
    @objc public enum BubbleTransitionMode: Int{
        
        case present , pop , dismiss
    }
    
    open var transitionMode: BubbleTransitionMode = .present
    
    open var startPoint = CGPoint.zero {
        didSet{
            bubble.center = startPoint
        }
    }
    
    
    var animationBlock:((_ transitionMode: BubbleTransitionMode) -> ())?
}


extension BubbleTransition: UIViewControllerAnimatedTransitioning{
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        fromViewController?.beginAppearanceTransition(false, animated: true)
        toViewController?.beginAppearanceTransition(true, animated: true)
        
        if transitionMode == .present {
            let presentViewControllerView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            let originalCenter = presentViewControllerView.center
            let originalSize = presentViewControllerView.frame.size
            
            bubble = UIView()
            bubble.frame = frameForBubble(originalCenter, size: originalSize, start: startPoint)
            bubble.layer.cornerRadius = bubble.frame.size.width / 2
            bubble.center = startPoint
            bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            bubble.backgroundColor = bubbleColor
            containerView.addSubview(bubble)
            
            presentViewControllerView.center = startPoint
            presentViewControllerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            presentViewControllerView.alpha = 0
            containerView.addSubview(presentViewControllerView)
            
            UIView.animate(withDuration: duration, animations: {
                self.bubble.transform = CGAffineTransform.identity
                presentViewControllerView.transform = CGAffineTransform.identity
                presentViewControllerView.alpha = 1
                presentViewControllerView.center = originalCenter
                if self.animationBlock != nil {
                    self.animationBlock!(self.transitionMode)
                }
            }, completion: { (_) in
                transitionContext.completeTransition(true)
                self.bubble.isHidden = true
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
            })
            
        }else{
            let key = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            let returnControllerView = transitionContext.view(forKey: key)!
            let originalCenter = returnControllerView.center
            let originalSize = returnControllerView.frame.size
            
            bubble.frame = frameForBubble(originalCenter, size: originalSize, start: startPoint)
            bubble.layer.cornerRadius = bubble.frame.size.width / 2
            bubble.center = startPoint
            bubble.isHidden = false
            
            UIView.animate(withDuration: duration, animations: {
                self.bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                returnControllerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                returnControllerView.center = self.startPoint
                returnControllerView.alpha = 0
                
                if self.transitionMode == .pop {
                    containerView.insertSubview(returnControllerView, belowSubview: returnControllerView)
                    containerView.insertSubview(self.bubble, belowSubview: returnControllerView)
                }
                
                
                if self.animationBlock != nil {
                    self.animationBlock!(self.transitionMode)
                }
                
            }, completion: { (_) in
                returnControllerView.center = originalCenter
                returnControllerView.removeFromSuperview()
                self.bubble.removeFromSuperview()
                transitionContext.completeTransition(true)
                
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
                
            })
    
            
        }
        
        
        
    }
    
    
    

}

private extension BubbleTransition {
    func frameForBubble(_ originalCenter: CGPoint, size originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x)
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
}
