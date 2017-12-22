//
//  InterfaceController.swift
//  WatchApp_Guess Extension
//
//  Created by jiaoyu on 2017/12/21.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController ,WCSessionDelegate{

    

    @IBOutlet var resultofGuess: WKInterfaceLabel!
    @IBOutlet var resultConfirmButton: WKInterfaceButton!
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var resultSlider: WKInterfaceSlider!
    
    var numberToBeGuessed: Int!
    var numberOfSlider: Int = 3
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
   
    @IBAction func slideUpdate(_ value: Float) {
        numberOfSlider = Int(value * 5)
        resultLabel.setText("Your guess: \(numberOfSlider)")
        
    }
    @IBAction func guessAction() {
        if numberToBeGuessed == nil {
            resultofGuess.setText("Open iPhone App first")
        }else if numberOfSlider == numberToBeGuessed {
            resultofGuess.setText("回答正确")
        }else{
            resultofGuess.setText("再猜一次")
        }
        
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        if WCSession.isSupported(){
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        numberToBeGuessed = applicationContext["numberToBeGuessed"] as! Int
    }
    

}
