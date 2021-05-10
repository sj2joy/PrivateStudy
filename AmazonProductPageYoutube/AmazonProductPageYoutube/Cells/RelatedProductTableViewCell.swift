//
//  RelatedProductTableViewCell.swift
//  AmazonProductPageYoutube
//
//  Created by mac on 2021/05/10.
//

import UIKit

struct RelatedProductTableViewCellModel {
    let image: UIImage?
    let title: String
}

class RelatedProductTableViewCell: UITableViewCell {

    static let identifier = "RelatedProductTableViewCell"
    let productImageView = UIImageView()
    let productLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        contentView.addSubview(productImageView)
        
        productLabel.numberOfLines = 0
        contentView.addSubview(productLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.frame.size.height
        productImageView.frame = CGRect(x: 5, y: 0, width: imageSize, height: imageSize)
        
        productLabel.frame = CGRect(x: 15 + imageSize, y: 0, width: contentView.frame.size.width - 20 - imageSize, height: imageSize)
    }
    
    public func configure(with viewModel: RelatedProductTableViewCellModel) {
        productLabel.text = viewModel.title
        productImageView.image = viewModel.image
    }
    
}
