//
//  DetailViewController.swift
//  SwiftDemo17
//
//  Created by jiaoyu on 2017/12/21.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    init(with model:Dictionary<String,Any>){
        super.init(nibName: nil, bundle: nil)
        let cover = model["cover"] as? UIImage
        let description = model["description"] as? String
        let name = model["name"] as? String
        
        let coverImageview = UIImageView(frame: CGRect(x: 10, y: 80, width: 100, height: 140))
        self.view.addSubview(coverImageview)
        coverImageview.image = cover
        coverImageview.center.x = self.view.center.x
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: coverImageview.frame.height + 70, width: 300, height: 50))
        nameLabel.text = name
        nameLabel.textAlignment = .center
        self.view.addSubview(nameLabel)
        nameLabel.center.x = self.view.center.x
        
        let textviewY:CGFloat = coverImageview.frame.height + 50 + 50 + 10
        let textView = UITextView(frame: CGRect(x: 0, y: textviewY, width: self.view.frame.width, height: self.view.frame.height - textviewY - 10))
        self.view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = description
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isToolbarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
