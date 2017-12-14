//
//  ViewController.swift
//  SwiftDemo12
//
//  Created by jiaoyu on 2017/12/14.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var slotMachine : UIPickerView!
    var resultLabel : UILabel!
    var emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createSoltMachine()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createSoltMachine()  {
        slotMachine = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220))
        slotMachine.delegate = self
        slotMachine.dataSource = self
        slotMachine.center.x = self.view.center.x
        slotMachine.center.y = self.view.center.y - 50
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1 , inComponent: 0, animated: false)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 1, animated: false)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 2, animated: false)
        self.view.addSubview(slotMachine)
        
        let goButton = UIButton(type: .custom)
        goButton.frame = CGRect(x: 50, y: slotMachine.frame.maxY + 50, width: 275, height: 40)
        goButton.backgroundColor = UIColor.orange
        goButton.setTitle("GO", for: .normal)
        goButton.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(goButton)
        goButton.addTarget(self, action: #selector(goAction), for: .touchUpInside)
        
        let doubleTapGesure = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTapGesure.numberOfTapsRequired = 2
        goButton.addGestureRecognizer(doubleTapGesure)
        
        
        resultLabel = UILabel(frame: CGRect(x: 0, y: goButton.frame.maxY+50, width: self.view.frame.width, height: 50))
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.textColor = UIColor.black
        resultLabel.text = ""
        self.view.addSubview(resultLabel)
        
        
        
    }
    
    
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont.systemFont(ofSize: 60)
        pickerLabel.text = emojiArray[row]
        return pickerLabel
    }
    
    @objc func goAction()  {
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 1, animated: true)

        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 2, animated: true)

        judge()
        
    }

    @objc func doubleTap()  {
        let result = Int(arc4random())%(emojiArray.count - 2)
        slotMachine.selectRow(result + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(result + 1, inComponent: 1, animated: true)

        slotMachine.selectRow(result + 1, inComponent: 2, animated: true)

        judge()
    }
    
    func judge() {
        if slotMachine.selectedRow(inComponent: 0) == slotMachine.selectedRow(inComponent: 1) && slotMachine.selectedRow(inComponent: 1) == slotMachine.selectedRow(inComponent: 2) {
            resultLabel.text = "👏👏👏"
        }else{
            resultLabel.text = "💔💔💔"
        }
        
    }

}

