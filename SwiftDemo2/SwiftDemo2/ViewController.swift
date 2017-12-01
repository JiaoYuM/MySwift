//
//  ViewController.swift
//  SwiftDemo2
//
//  Created by jiaoyu on 2017/12/1.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var result: UILabel!
    var timer: Timer!
    var labelNumber:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let startView = UIView()
        
        result = UILabel()
        result.textColor = UIColor.black
        result.font = UIFont.systemFont(ofSize: 30)
        result.text = "0"
        result.frame = CGRect(x: 0, y: 100, width: 375, height: 50)
        result.textAlignment = NSTextAlignment.center
        self.view .addSubview(result)
        
        startView.backgroundColor = UIColor.init(red: 1, green: 101/255.0, blue: 27/255.0, alpha: 1)
        startView.frame = CGRect(x: 0, y: 300, width: self.view.frame.width/2, height: 367)
        self.view.addSubview(startView)
        
        let startButton = UIButton(type: .custom)
        startButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: 367)
        startButton.setTitle("start", for: UIControlState.normal)
        startButton.addTarget(self, action: #selector(startTime), for: UIControlEvents.touchUpInside)
        startView.addSubview(startButton)
        
        let endView = UIView()
        endView.frame = CGRect(x: self.view.frame.width/2, y: 300, width: self.view.frame.width/2, height: 367)
        endView.backgroundColor = UIColor.init(red: 98/255.0, green: 242/255.0, blue: 23/255.0, alpha: 1)
        self.view.addSubview(endView)
        let stopButton = UIButton(type: .custom)
        stopButton.setTitle("end", for: UIControlState.normal)
        stopButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: 367)
        stopButton.addTarget(self, action: #selector(stopTimer), for: UIControlEvents.touchUpInside)
        endView.addSubview(stopButton)
        
        let resetButton = UIButton(type: UIButtonType.custom)
        resetButton.setTitle("Reset", for: UIControlState.normal)
        resetButton.addTarget(self, action: #selector(resetTimer), for: UIControlEvents.touchUpInside)
        resetButton.frame = CGRect(x: 375 - 120, y: 10, width: 100, height: 50)
        self.view.addSubview(resetButton)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startTime() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            self.labelNumber = self.labelNumber + 0.1
            self.result.text = String(format : "%.1f", self.labelNumber)
        })
        //触发重复的定时器
        self.timer.fire()
    }
    
    
    @objc func stopTimer() {
        guard let timerforDistory = self.timer else {  //条件语句为false时 执行else中的语句
            return
        }
        
        timerforDistory.invalidate()
    }
    
    @objc func resetTimer() {
        self.labelNumber = 0
        self.result.text = "0"
    }
}

