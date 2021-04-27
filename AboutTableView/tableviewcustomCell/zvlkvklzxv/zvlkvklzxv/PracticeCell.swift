//
//  PracticeCell.swift
//  zvlkvklzxv
//
//  Created by mac on 2020/10/25.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit

class PracticeCell: UITableViewCell {
    
    var animalImage = UIImageView()
    let titleLabel = UILabel()
    let subLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(animalImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: self.frame.width - 220, y: 15, width: 100, height: frame.height - 30)
        subLabel.frame = CGRect(x: self.frame.width - 120, y: 15, width: 100, height: frame.height - 30)
        animalImage.frame = CGRect(x: self.frame.minX + 10, y: 10, width: 70, height: frame.height - 10)
         }
    
}
