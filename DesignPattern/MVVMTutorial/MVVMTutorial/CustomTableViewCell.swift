//
//  CustomTableViewCell.swift
//  MVVMTutorial
//
//  Created by mac on 2021/04/19.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let myLabel = UILabel()
    static let identifier = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        myLabel.frame = contentView.bounds
        myLabel.numberOfLines = 0
        myLabel.textAlignment = .center
        contentView.addSubview(myLabel)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: Person) {
        myLabel.text = " name: \(viewModel.firstName)/ \(viewModel.lastName)/ age: \(viewModel.age)/ gender: \(viewModel.gender)/ height: \(viewModel.height)"
    }
}
