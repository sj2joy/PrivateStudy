//
//  MyCustomCollectionCellCollectionViewCell.swift
//  CollectionViewCompositionalLayoutPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

class MyCustomCollectionCellCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCustomCollectionCellCollectionViewCell"
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        contentView.addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.frame = contentView.bounds
        imageView.contentMode = .scaleAspectFill
        
        let images: [UIImage] = [
            UIImage(named: "Image1"),
            UIImage(named: "Image2"),
            UIImage(named: "Image3"),
            UIImage(named: "Image4"),
            UIImage(named: "Image5"),
            UIImage(named: "Image6"),
        ].compactMap({ $0 })
        
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
}
