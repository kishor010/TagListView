//
//  UIViewController+Extensions.swift
//  TagList
//
//  Created by Kishor on 1/7/22.
//


import UIKit

class UserProfileTagsFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributesForElementsInRect = super.layoutAttributesForElements(in: rect) else { return nil }
        guard var newAttributesForElementsInRect = NSArray(array: attributesForElementsInRect, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
        
        var leftMargin: CGFloat = 0.0;
        
        /*for attributes in attributesForElementsInRect {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            }
            
            /*else if (attributes.frame.origin.x + attributes.frame.size.width > collectionViewWidth) {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin//self.sectionInset.left
                attributes.frame = newLeftAlignedFrame
             }*/
            
            else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8 // Makes the space between cells
            newAttributesForElementsInRect.append(attributes)
        }*/
        
        //-----------------
        for attributes in attributesForElementsInRect {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            }
            
            else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8 // Makes the space between cells
            newAttributesForElementsInRect.append(attributes)
        }
        
        return newAttributesForElementsInRect
    }
}

class SelfSizingCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isScrollEnabled = false
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
        //return CGSize(width: UIView.noIntrinsicMetric, height: collectionViewLayout.collectionViewContentSize.height)
    }
}













//----------------------

/*
//  UIViewController+Extensions.swift
//  TagList
//
//  Created by Kishor on 1/7/22.
//


import UIKit

class UserProfileTagsFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // unwrap super's attributes
        guard let attributesForElementsInRect = super.layoutAttributesForElements(in: rect) else { return nil }

            // copy items
        guard var newAttributesForElementsInRect = NSArray(array: attributesForElementsInRect, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
            //guard let attributes = NSArray(array: superArray, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }

        
        //let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        //var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        
        var leftMargin: CGFloat = 0.0;
        
        for attributes in attributesForElementsInRect {
            
            //let collectionViewWidth = self.collectionView?.frame.width ?? 0 - (self.sectionInset.right + self.sectionInset.left)
            /**/
            
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            }
            
            /*else if (attributes.frame.origin.x + attributes.frame.size.width > collectionViewWidth) {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = self.sectionInset.left
                attributes.frame = newLeftAlignedFrame
             }*/
            
            else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8 // Makes the space between cells
            newAttributesForElementsInRect.append(attributes)
        }
        
        return newAttributesForElementsInRect
    }
}

class SelfSizingCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isScrollEnabled = false
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
        //return CGSize(width: UIView.noIntrinsicMetric, height: collectionViewLayout.collectionViewContentSize.height)
    }
}*/
