//
//  ViewController.swift
//  Swift18
//
//  Created by jiaoyu on 2017/12/21.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

    var wcsession : WCSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let generateNumberBtn = UIButton(type: .custom)
        generateNumberBtn.frame = CGRect(x: 10, y: 10, width: 200, height: 50)
        generateNumberBtn.setTitleColor(UIColor.black, for: .normal)
        generateNumberBtn.setTitle("Generate Number", for: .normal)
        self.view.addSubview(generateNumberBtn)
        generateNumberBtn.addTarget(self, action: #selector(generateNumber), for: .touchUpInside)
        generateNumberBtn.center = self.view.center
        generateNumberBtn.setTitleColor(UIColor.red, for: .highlighted)
        generateNumberBtn.setTitleColor(UIColor.green, for: .selected)
        generateNumberBtn.layer.borderColor = UIColor.black.cgColor
        generateNumberBtn.layer.borderWidth = 1
        generateNumberBtn.layer.cornerRadius = 8
        
        wcsession = WCSession.default
        if WCSession.isSupported() {
            wcsession.delegate = self
            wcsession.activate()
        }
        
        self.view.backgroundColor = UIColor.yellow
        
    }
    
    
    @objc func generateNumber()  {
        let number:Int = Int(arc4random()) % 5 + 1
        do {
            try wcsession.updateApplicationContext(["numberToBeGuessed" : number])
        } catch  {
            print("error Happened!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

