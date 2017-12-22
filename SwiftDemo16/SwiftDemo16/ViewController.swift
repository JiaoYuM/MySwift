//
//  ViewController.swift
//  SwiftDemo16
//
//  Created by jiaoyu on 2017/12/20.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController , UIViewControllerPreviewingDelegate{

    
    var actionLabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 400, height: 50))
        actionLabel.text = "Please press the 3D action"
        self.view.addSubview(actionLabel)
        
        let notificationName = NSNotification.Name(rawValue: "ShortcutAction")
        NotificationCenter.default.addObserver(self, selector: #selector(shortCutActionClicked(sender:)), name: notificationName, object: nil)
        
        let fingerPrintImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 128, height: 128))
        fingerPrintImageView.image = #imageLiteral(resourceName: "fingerprint.png")
        self.view.addSubview(fingerPrintImageView)
        fingerPrintImageView.center = self.view.center
        
        self.registerForPreviewing(with: self, sourceView: self.view)
        
    }
    
    func changeLabel(with name:String)  {
        actionLabel.text = name
    }
    
    @objc func shortCutActionClicked(sender:Notification) {
        let shortcutItem = sender.userInfo?["shortcutItem"] as! UIApplicationShortcutItem
        if shortcutItem.type == "LoveItem" {
            self.changeLabel(with: "Yes, I do ❤️ you!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        previewingContext.sourceRect = CGRect(x: 10, y: 10, width: self.view.frame.width - 20, height: self.view.frame.height - 10)
        return SFSafariViewController(url: NSURL(string: "http://www.qq.com")! as URL)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }

}


extension SFSafariViewController{
    open override var previewActionItems: [UIPreviewActionItem] {
        let deleteAction = UIPreviewAction(title: "删除", style: .destructive) { (previewAction, vc) in
            print("Delete")
        }
        
        let doneAction = UIPreviewAction(title: "完成", style: .default) { (previewAction, vc) in
            print("Done")
        }
        
        return [deleteAction , doneAction]
    }
        
}


