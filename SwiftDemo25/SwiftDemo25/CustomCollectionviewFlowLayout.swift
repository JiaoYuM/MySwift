//
//  CustomCollectionviewFlowLayout.swift
//  SwiftDemo25
//
//  Created by jiaoyu on 2018/1/2.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

class CustomCollectionviewFlowLayout: UICollectionViewFlowLayout {
    
    var imageVH:CGFloat!
    var inset:CGFloat!
    
    override func prepare() {
        super.prepare()
        
        let collectionW = self.collectionView?.frame.size.width
        self.itemSize = CGSize(width: collectionW! * 0.5, height: collectionW! * 0.6)
        let leftRight = (collectionW! - itemSize.width) * 0.5
        self.sectionInset = UIEdgeInsetsMake(0, leftRight, 0, leftRight)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var lastRect = CGRect()
        lastRect.size = (self.collectionView?.frame.size)!
        lastRect.origin = proposedContentOffset
        
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.width)! * 0.5
        var adjustX = MAXFLOAT
        
        let array = self.layoutAttributesForElements(in: lastRect)
        
        for attr in array! {
            if (abs(Float(attr.center.x - centerX)) < abs(adjustX)) {
                adjustX = Float(attr.center.x - centerX)
            }
        }
        return CGPoint(x: proposedContentOffset.x + CGFloat(adjustX), y: proposedContentOffset.y)
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let newArr = super.layoutAttributesForElements(in: rect)
        let collectionViewCenterX = (self.collectionView?.frame.size.width)! * 0.5 + (self.collectionView?.contentOffset.x)!
        
        for attributes in newArr! {
            let scale = 1 - abs(attributes.center.x - collectionViewCenterX) / (self.collectionView?.frame.size.width)! * 0.5
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
            
        }
        return newArr
    }
}
