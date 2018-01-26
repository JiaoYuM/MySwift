//
//  ViewController.swift
//  BonusCalculate
//
//  Created by jiaoyu on 2018/1/23.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ClickButtonDelegate {
    var incomeType:String?
    var startMoney:String?
    var mainview:MainView!
    
    var shuilv:Float?
    var kouchushu:Float?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人所得税"
        mainview = MainView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height))
        mainview.delegate = self
        self.view.addSubview(mainview)
        
        mainview.incomeTypeBtn.addTarget(self, action: #selector(chooseType(sender:)), for: .touchUpInside)
        mainview.incomeTypeBtn.tag = 101
        mainview.startMoney.addTarget(self, action: #selector(chooseType(sender:)), for: .touchUpInside)
        mainview.startMoney.tag = 102
    
    }
    
    
    @objc func chooseType(sender:UIButton) {
        let typeVC = TypeViewController()
        if sender.tag == 101 {
            typeVC.dataSource = ["工资","年终奖"]
            typeVC.selectedType = { (type:String) -> Void in
                self.incomeType = type
                self.mainview.incomeTypeBtn.setTitle(self.incomeType, for: .normal)
            }
        }else{
            typeVC.dataSource = ["3500","4800"]
            typeVC.selectedType = { (type:String) -> Void in
                self.startMoney = type
                  self.mainview.startMoney.setTitle(self.startMoney, for: .normal)
            }
        }
        self.navigationController?.pushViewController(typeVC, animated: true)
    }

    //MARK: -ClickButtonDelegate
    func calculate(sender: UIButton) {
        
        
        if sender.tag == 201 {   //计算
            
            guard let _ = incomeType,
                let _ = startMoney,
                let _ = self.mainview.preTaxMoney.text,
                let _ = self.mainview.insuranceMoney.text
                else{
                    let alertController = UIAlertController(title: "不能输入为空", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)

                    return
            }
            
            
            
            
//            if  let income = incomeType
//                let start = startMoney
//
//                {
//                let alertController = UIAlertController(title: "不能输入为空", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//                return
//            }
            calculateMoney()
        }else{
            //重置
            resetSalary()
        }
    }
    
    //计算
    func calculateMoney()  {
        let salary = Float(mainview.preTaxMoney.text!)!
        let insurance = Float(mainview.insuranceMoney.text!)!
        if salary <= Float(startMoney!)! {
            mainview.retalLabel.text = "0"
            mainview.taxRate.text = "0"
            mainview.susuanLabel.text = "0"
            mainview.shuikuanLabel.text = "0"
            mainview.shifaLabel.text = "\(salary)"
            return
        }
        //工资
        if incomeType == "工资" {
            let yinjiaoshuie = salary - insurance - Float(startMoney!)!

            switch yinjiaoshuie{
            case 0..<1500:
                shuilv = 0.03
                kouchushu = 0
            case 1500..<4500:
                shuilv = 0.1
                kouchushu = 105
            case 4500..<9000:
                shuilv = 0.2
                kouchushu = 555
                
            case 9000..<35000:
                shuilv = 0.25
                kouchushu = 1005
                
            case 35000..<55000:
                shuilv = 0.3
                kouchushu = 2755
                
            case 55000..<80000:
                shuilv = 0.35
                kouchushu = 5505
                
            case 80000...MAXFLOAT:
                shuilv = 0.45
                kouchushu = 13505
                
            default:
                print("s")
                
            }
            
            let yingjiaoshuikuan = yinjiaoshuie * shuilv! - kouchushu!
            let shifa = salary - insurance - yingjiaoshuikuan
            
            configLabel(x1: yinjiaoshuie, x2: shuilv!, x3: kouchushu!, x4: yingjiaoshuikuan, x5: shifa)
            
            
        }else{        //年终奖
            
            let averageMoney = salary / 12
            switch averageMoney{
            case 0..<1500:
                shuilv = 0.03
                kouchushu = 0
            case 1500..<4500:
                shuilv = 0.1
                kouchushu = 105
            case 4500..<9000:
                shuilv = 0.2
                kouchushu = 555
                
            case 9000..<35000:
                shuilv = 0.25
                kouchushu = 1005
                
            case 35000..<55000:
                shuilv = 0.3
                kouchushu = 2755
                
            case 55000..<80000:
                shuilv = 0.35
                kouchushu = 5505
                
            case 80000...MAXFLOAT:
                shuilv = 0.45
                kouchushu = 13505
            default:
                print("s")
            }
            
            let shuikuan = salary * shuilv! - kouchushu!
            let shifa = salary - shuikuan
            configLabel(x1: salary, x2: shuilv!, x3: kouchushu!, x4: shuikuan, x5: shifa)
            
        }
    }
    //重置
    func resetSalary() {
        self.mainview.incomeTypeBtn.setTitle(">", for: UIControlState.normal)
        self.mainview.preTaxMoney.text = ""
        self.mainview.insuranceMoney.text = ""
        self.mainview.startMoney.setTitle(">", for: UIControlState.normal)
        self.mainview.retalLabel.text = ""
        self.mainview.taxRate.text = ""
        self.mainview.susuanLabel.text = ""
        self.mainview.shuikuanLabel.text = ""
        self.mainview.shifaLabel.text = ""
        
        incomeType = nil
        startMoney = nil
        shuilv = 0
        kouchushu = 0
    }
    
    func configLabel(x1:Float,x2:Float,x3:Float,x4:Float,x5:Float) {
        mainview.retalLabel.text = "\(x1)"
        mainview.taxRate.text = "\(x2)"
        mainview.susuanLabel.text = "\(x3)"
        mainview.shuikuanLabel.text = "\(x4)"
        mainview.shifaLabel.text = "\(x5)"
    }

}

