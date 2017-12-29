//
//  ViewController.swift
//  SwiftDemo24
//
//  Created by jiaoyu on 2017/12/29.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {
    
    var maskView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let bgImageview = UIImageView(image: #imageLiteral(resourceName: "twitterBG.jpeg"))
        bgImageview.frame = self.view.frame
        self.view.addSubview(bgImageview)
        
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view.center
        logoLayer.contents = #imageLiteral(resourceName: "logo.png").cgImage
        view.layer.mask = logoLayer
        
        maskView = UIView(frame: view.frame)
        maskView.backgroundColor = UIColor.white
        self.view.addSubview(maskView)
        
        let appdelegate = UIApplication.shared.delegate
        let window = appdelegate?.window!
        window?.backgroundColor = UIColor(red: 29/255.0, green: 161/255.0, blue: 242/255.0, alpha: 1)
        
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = 1
        logoAnimation.keyTimes = [0,0.4,1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                         CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        logoAnimation.fillMode = kCAFillModeForwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")

        let logoOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        logoOpacityAnimation.beginTime = CACurrentMediaTime() + 1
        logoOpacityAnimation.duration = 1
        logoOpacityAnimation.fromValue = 1
        logoOpacityAnimation.toValue = 0
        logoOpacityAnimation.delegate = self
        maskView.layer.add(logoOpacityAnimation, forKey: "opacityAnimation")
        
    }

    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.maskView.removeFromSuperview()
        self.view.layer.mask = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

