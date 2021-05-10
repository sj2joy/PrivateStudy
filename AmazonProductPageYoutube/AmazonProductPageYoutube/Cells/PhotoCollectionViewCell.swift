//
//  PhotoCollectionViewCell.swift
//  AmazonProductPageYoutube
//
//  Created by mac on 2021/05/10.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    static let identifier = "PhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    public func configure(with image: UIImage) {
        imageView.image = image
    }
}
