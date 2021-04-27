//
//  DemoTableViewCell.swift
//  TableViewPractice
//
//  Created by mac on 2021/04/13.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
