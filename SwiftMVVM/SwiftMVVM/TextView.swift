//
//  TextView.swift
//  SwiftMVVM
//
//  Created by jiaoyu on 2018/1/9.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class TextView: UIView {
    private var myContext = 0
    fileprivate lazy var button: UIButton = {
     
        let btn = UIButton(type: UIButtonType.system)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        btn.setTitle("换装", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.titleLabel?.textColor = UIColor.black
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
        return btn
    }()

    var textViewModel: TextviewModel!
    
    init(viewModel: TextviewModel) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textViewModel = viewModel
        
        addSubview(button)
        
        bindingViewModel()
        
        textViewModel.reloadData()
        
    }
    
    deinit {
        textViewModel.removeObserver(self, forKeyPath: "color")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindingViewModel() {
        textViewModel.addObserver(self, forKeyPath: "color", options: [.new,.old], context: &myContext)
    }
    
    @objc func buttonClick() {
        textViewModel.reloadData()
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "color"{
            backgroundColor = textViewModel.color
        }
    }
    
}
