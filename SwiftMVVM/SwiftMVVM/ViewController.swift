//
//  ViewController.swift
//  SwiftMVVM
//
//  Created by jiaoyu on 2018/1/9.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var textviewModel: TextviewModel = {
        let model = TextviewModel()
        return model
    }()

    private lazy var textView: TextView = {
        let view = TextView(viewModel: textviewModel)
        view.frame = UIScreen.main.bounds
        return view
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

