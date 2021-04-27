//
//  CustomTableViewCell.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/25.
//

import UIKit

class MemoTitleCell: UITableViewCell {
    
    static let identifier = "memoTitleCell"
    var titleLabel = UILabel()
    let dateLabel = UILabel()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        addSubview(titleLabel)
        titleLabel.text = "Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
        addSubview(dateLabel)
        dateLabel.text = "Date"
        dateLabel.textAlignment = .right
        dateLabel.numberOfLines = 2
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        addSubview(contentLabel)
        contentLabel.text = "Contents"
        contentLabel.numberOfLines = 2
        contentLabel.lineBreakMode = .byTruncatingTail
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentLabel.heightAnchor.constraint(equalToConstant: 25),
            contentLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

//MARK: - MemoContentsCell
class MemoContentsCell: UITableViewCell {
    
    static let identifier = "memoContentsCell"
    var titleLabel = UILabel()
    let dateLabel = UILabel()
    var contentLabel = UILabel()
    let contentImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        
        addSubview(contentImage)
        contentImage.contentMode = .scaleAspectFit
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            contentImage.widthAnchor.constraint(equalToConstant: 50),
        ])

        addSubview(titleLabel)
        titleLabel.text = "Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        addSubview(dateLabel)
        dateLabel.text = "Date"
        dateLabel.textAlignment = .right
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.numberOfLines = 2
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        addSubview(contentLabel)
        contentLabel.text = "Contents"
        contentLabel.numberOfLines = 2
        contentLabel.lineBreakMode = .byTruncatingTail
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            contentLabel.heightAnchor.constraint(equalToConstant: 25),
            contentLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
