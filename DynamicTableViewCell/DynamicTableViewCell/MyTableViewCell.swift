//
//  MyTableViewCell.swift
//  DynamicTableViewCell
//
//  Created by mac on 2020/11/12.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("awakeFromNip has called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
    }
    
}
