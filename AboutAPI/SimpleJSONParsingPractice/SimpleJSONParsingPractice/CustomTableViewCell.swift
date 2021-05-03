//
//  CustomTableViewCell.swift
//  vjiodorqe
//
//  Created by mac on 2021/05/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        addSubview(nameLabel)
        nameLabel.backgroundColor = .systemBlue
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "Arial", size: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
        ])
        addSubview(emailLabel)
        emailLabel.backgroundColor = .systemYellow
        emailLabel.numberOfLines = 0
        emailLabel.font = UIFont(name: "Arial", size: 13)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
           emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
           emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
           emailLabel.widthAnchor.constraint(equalToConstant: 150),
        ])
    }

}
