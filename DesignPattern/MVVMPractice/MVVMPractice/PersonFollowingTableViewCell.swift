//
//  PersonFollowingTableViewCell.swift
//  MVVMPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell,
                                      didTabWith viewModel: PersonFollowingTableViewCellViewModel
    )
}

class PersonFollowingTableViewCell: UITableViewCell {

    static let identifier = "PersonFollowingTableViewCell"
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    var viewModel: PersonFollowingTableViewCellViewModel?
    let userImageView = UIImageView()
    let nameLabel = UILabel()
    let userNameLabel = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        userNameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
    
    public func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        userNameLabel.text = viewModel.userName
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("UnFollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    func setupUI() {
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFit
        userImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: contentView.frame.size.height - 10,
                                     height: contentView.frame.size.height - 10)
        contentView.addSubview(userImageView)
        
        nameLabel.textColor = .label
        nameLabel.frame = CGRect(x: contentView.frame.size.height,
                                 y: 0,
                                 width: contentView.frame.size.width - contentView.frame.size.height - 10,
                                 height: contentView.frame.size.height / 2)
        contentView.addSubview(nameLabel)
        
        userNameLabel.textColor = .secondaryLabel
        userNameLabel.frame = CGRect(x: contentView.frame.size.height,
                                     y: contentView.frame.size.height / 2,
                                     width: contentView.frame.size.width - contentView.frame.size.height - 10, height: contentView.frame.size.height / 2)
        contentView.addSubview(userNameLabel)
        
        button.frame = CGRect(x: contentView.frame.size.width - 60, y: 10, width: 110, height: contentView.frame.size.height - 20)
        button.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        contentView.addSubview(button)
    }
    @objc private func didTabButton(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        delegate?.personFollowingTableViewCell(self, didTabWith: viewModel)
        prepareForReuse()
        configure(with: newViewModel)
    }
}
