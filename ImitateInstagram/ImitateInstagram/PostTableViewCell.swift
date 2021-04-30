//
//  PostTableViewCell.swift
//  ImitateInstagram
//
//  Created by mac on 2021/04/14.
//

import UIKit


class PostTableViewCell: UITableViewCell {
    
    
    static let identifier = "PostTableViewCell"
    let userImageView = UIImageView()
    let postImageView = UIImageView()
    let userNameLabel = UILabel()
    let likesLabel = UILabel()
    let topContainerView = UIView()
    let bottomContainerView = UIView()
    let buttonView = UIView()
    let likesButton = UIButton()
    let messageButton = UIButton()
    let actionButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        contentView.addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints   = false
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            topContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            topContainerView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        contentView.addSubview(bottomContainerView)
//        bottomContainerView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bottomContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bottomContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bottomContainerView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints         = false
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 10),
            postImageView.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: -10),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        topContainerView.addSubview(userImageView)
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = 40
        userImageView.translatesAutoresizingMaskIntoConstraints      = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 0),
            userImageView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 0),
            userImageView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 0),
            userImageView.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        topContainerView.addSubview(userNameLabel)
        userNameLabel.text                                          = "@Instagram"
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        userNameLabel.translatesAutoresizingMaskIntoConstraints     = false
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 0),
            userNameLabel.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 0),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: 0)
        ])
        
        bottomContainerView.addSubview(buttonView)
//        buttonView.backgroundColor                               = .systemBlue
        buttonView.translatesAutoresizingMaskIntoConstraints     = false
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 10),
            buttonView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 10),
            buttonView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -10),
            buttonView.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        bottomContainerView.addSubview(likesLabel)
        likesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        likesLabel.translatesAutoresizingMaskIntoConstraints         = false
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 0),
            likesLabel.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 30),
            likesLabel.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: 0),
            likesLabel.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -20),
        ])
        
        buttonView.addSubview(likesButton)
        likesButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likesButton.translatesAutoresizingMaskIntoConstraints         = false
        NSLayoutConstraint.activate([
            likesButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0),
            likesButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 0),
            likesButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 0),
            likesButton.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        buttonView.addSubview(messageButton)
        messageButton.setImage(UIImage(systemName: "message"), for: .normal)
        messageButton.translatesAutoresizingMaskIntoConstraints         = false
        NSLayoutConstraint.activate([
            messageButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0),
            messageButton.leadingAnchor.constraint(equalTo: likesButton.trailingAnchor, constant: 0),
            messageButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 0),
            messageButton.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        buttonView.addSubview(actionButton)
        actionButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints         = false
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0),
            actionButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 0),
            actionButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 0),
            actionButton.widthAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: InstagramPost) {
        self.likesLabel.text                = "\(model.numberOfLikes) Likes"
        self.userNameLabel.text             = model.userName
        self.userImageView.image            = UIImage(named: model.userImageName)
        self.postImageView.image            = UIImage(named: model.postImageName)
    }
}
