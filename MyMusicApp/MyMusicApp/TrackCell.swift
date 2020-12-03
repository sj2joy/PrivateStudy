//
//  TrackCell.swift
//  MyMusicApp
//
//  Created by mac on 2020/10/25.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    let thumbnail = UIImageView()
    let titleLabel = UILabel()
    let artistLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(thumbnail)
        contentView.addSubview(titleLabel)
        contentView.addSubview(artistLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        artistLabel.textColor = .lightGray
        artistLabel.font = UIFont(name: "Arial", size: 14)
        artistLabel.frame = CGRect(x: self.frame.minX + 150, y: 45, width: 100, height: 20)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 2 
        titleLabel.frame = CGRect(x: self.frame.minX + 150, y: 5, width: 190, height: 30)
        
        thumbnail.frame = CGRect(x: self.frame.minX + 10, y: 5, width: 110, height: 70)
    }
    
}
