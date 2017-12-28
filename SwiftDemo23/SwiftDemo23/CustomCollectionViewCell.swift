//
//  CustomCollectionViewCell.swift
//  SwiftDemo23
//
//  Created by jiaoyu on 2017/12/28.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configCell(model:CustomCollectionViewCellModel) {
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
    }
    
    
}
