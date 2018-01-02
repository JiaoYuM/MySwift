//
//  ViewController.swift
//  SwiftDemo25
//
//  Created by jiaoyu on 2018/1/2.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView!
    var dataSource : Array<CustomCollectionviewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景视图
        let bgview = UIView(frame: self.view.bounds)
        let bgImageview = UIImageView(frame: self.view.bounds)
        bgImageview.image = #imageLiteral(resourceName: "bg")
        bgview.addSubview(bgImageview)
        
        //模糊效果
        let blurEffect : UIBlurEffect = UIBlurEffect(style: .light)
        let blurView : UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        bgview.addSubview(blurView)
        
        //集合视图
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundView = bgview
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView)
        
        //加载数据
        createData()
        
        //分段控制器
        let segmentView = UISegmentedControl(items: ["FlowLayout","CustomLayout"])
        segmentView.frame = CGRect(x: 10, y: 50, width: self.view.frame.width - 20, height: segmentView.bounds.height)
        
        segmentView.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: UIControlState.normal)
        segmentView.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black], for: UIControlState.selected)
        segmentView.tintColor = UIColor.white
        segmentView.isMomentary = false
        segmentView.selectedSegmentIndex = 0
        segmentView.addTarget(self, action:#selector(segmentAction(sender:)) , for: UIControlEvents.touchUpInside)
        self.view.addSubview(segmentView)
        
        
    }

    @objc func segmentAction(sender:UISegmentedControl) {
        let layout = sender.selectedSegmentIndex == 0 ? UICollectionViewFlowLayout() : CustomCollectionviewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
    }
    
    func createData() {
        let model1 = CustomCollectionviewModel()
        model1.image = #imageLiteral(resourceName: "Photo1")
        
        let model2 = CustomCollectionviewModel()
        model2.image = #imageLiteral(resourceName: "Photo2")
        
        let model3 = CustomCollectionviewModel()
        model3.image = #imageLiteral(resourceName: "Photo3")
        
        let model4 = CustomCollectionviewModel()
        model4.image = #imageLiteral(resourceName: "Photo4")
        
        let model5 = CustomCollectionviewModel()
        model5.image = #imageLiteral(resourceName: "Photo5")
        
        dataSource = Array(arrayLiteral: model1,model2,model3,model4,model5)
    }
    
    
    //collectionviewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configCell(model: dataSource[indexPath.item])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

