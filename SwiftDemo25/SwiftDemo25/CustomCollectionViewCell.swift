//
//  CustomCollectionViewCell.swift
//  SwiftDemo25
//
//  Created by jiaoyu on 2018/1/2.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configCell(model:CustomCollectionviewModel) {
        let imageview = UIImageView(frame: self.bounds)
        imageview.image = model.image
        self.addSubview(imageview)
        
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
