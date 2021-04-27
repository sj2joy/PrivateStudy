//
//  CustomCollectionViewCell.swift
//  CollectionViewLikeInstagram
//
//  Created by mac on 2021/04/17.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    let imageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    func setupUI() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150.0 / 2.0
        imageView.backgroundColor = .systemYellow
        imageView.frame = contentView.bounds
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemRed.cgColor
        contentView.addSubview(imageView)
        
    }
    public func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
