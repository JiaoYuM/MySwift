//
//  MainView.swift
//  BonusCalculate
//
//  Created by jiaoyu on 2018/1/24.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

protocol ClickButtonDelegate {
    func calculate(sender:UIButton)
}

class MainView: UIView {

    @IBOutlet weak var incomeTypeBtn: UIButton!
    @IBOutlet weak var preTaxMoney: UITextField!
    @IBOutlet weak var insuranceMoney: UITextField!

    @IBOutlet weak var startMoney: UIButton!
    
    @IBOutlet weak var CalculateBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var retalLabel: UILabel!
    @IBOutlet weak var taxRate: UILabel!
    @IBOutlet weak var susuanLabel: UILabel!
    @IBOutlet weak var shuikuanLabel: UILabel!
    @IBOutlet weak var shifaLabel: UILabel!
    
    var delegate:ClickButtonDelegate?
    
    var contentView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadViewFromNib()
        addSubview(contentView)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView = loadViewFromNib()
        addSubview(contentView)
    
    }
    
    func loadViewFromNib() -> UIView {
        let view = UINib(nibName: "MainView", bundle: Bundle.main).instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
        
        
    }
    @IBAction func calculateAction(_ sender: UIButton) {
//        delegate?.calculate(sender: sender)
        delegate?.calculate(sender: sender)
        
    }
    
    
    @IBAction func resetActive(_ sender: UIButton) {
        delegate?.calculate(sender: sender)
    }
    
    
    
    
}



