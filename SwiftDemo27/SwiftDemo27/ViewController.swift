//
//  ViewController.swift
//  SwiftDemo27
//
//  Created by jiaoyu on 2018/1/3.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit
import Koloda
import SnapKit
import Alamofire

class ViewController: UIViewController ,KolodaViewDelegate,KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return DragSpeed.default
    }
    
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlayview = BeautyContestOverlayView(frame: self.kolodaview.frame)
        return overlayview
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[index])
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    
    

    var kolodaview : KolodaView!
    var dataSource = Array<UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        for index in 1...10 {
            dataSource.append(UIImage(named: "Photo\(index)")!)
        }
        
        self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        kolodaview = KolodaView()
        self.view.addSubview(kolodaview)
        kolodaview.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
        }
        kolodaview.delegate = self
        kolodaview.dataSource = self
        
        //不喜欢的按钮
        let dislikeBtn = UIButton(type: .custom)
        dislikeBtn.setImage(#imageLiteral(resourceName: "ic_skip"), for: .normal)
        self.view.addSubview(dislikeBtn)
        dislikeBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.left.equalTo(self.view.snp.left).offset(90)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        dislikeBtn.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
        
        //喜欢的按钮
        let likeButton = UIButton(type: .custom)
        likeButton.setImage(#imageLiteral(resourceName: "ic_like"), for: .normal)
        self.view.addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.right.equalTo(self.view.snp.right).offset(-90)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    
    }
    
    @objc func likeAction() {
        kolodaview.swipe(.right)
    }
    @objc func dislikeAction() {
        kolodaview.swipe(.left)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

