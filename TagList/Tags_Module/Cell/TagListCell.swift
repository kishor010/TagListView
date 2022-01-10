//
//  TagListCell.swift
//  TagList
//
//  Created by Kishor on 1/5/22.
//

import UIKit

class TagListCell: UITableViewCell {
    
    @IBOutlet weak var tagListCollection: SelfSizingCollectionView!
    var data: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func setCollectioView() {
        self.setupCollectionnViewLayout()
        
        self.tagListCollection.register(UINib(nibName: "TagListNameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagListNameCollectionViewCell")
        tagListCollection.delegate = self
        tagListCollection.dataSource = self
        
    }
    
    private func setupCollectionnViewLayout() {
        let layout = UserProfileTagsFlowLayout()
        //layout.estimatedItemSize = CGSize.init(width: 50, height: 50)
        layout.scrollDirection = .vertical
        tagListCollection.collectionViewLayout = layout
    }
    
    // MARK: UIView functions
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.tagListCollection.layoutIfNeeded()
        let size = tagListCollection.collectionViewLayout.collectionViewContentSize
        let newSize = CGSize(width: size.width, height: size.height + 1)
        debugPrint("New Size : \(newSize)")
        return newSize
    }
    
    func setData(data: [String]) {
        self.setCollectioView()
        self.data = data
    }
}

//MARK:- UICollectionView Delegate and DataSource
extension TagListCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagListNameCollectionViewCell", for: indexPath) as? TagListNameCollectionViewCell {
            cell.titleLable.text = data[indexPath.row]
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = data[indexPath.row]
        let font = UIFont.systemFont(ofSize: 17)//UIFont(name: "Label Test Data", size: 16)!
        let size = tag.size(withAttributes: [NSAttributedString.Key.font: font])
        let dynamicCellWidth = size.width
        return CGSize(width: dynamicCellWidth + 10, height: 50)
    }
    
    // Space between rows
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
