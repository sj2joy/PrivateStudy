//
//  MyCustomCollectionViewCell.swift
//  CollectionViewTutorial
//
//  Created by mac on 2021/04/16.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCustomCollectionViewCell"
    
    let label = UILabel()
    let imageView = UIImageView()
//    var models = [Model]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model: Model) {
        self.label.text = model.text
        self.imageView.image = UIImage(named: model.imageName)
    }
    
    func setupUI() {
        
//        contentView.addSubview(label)
//        label.textAlignment = .center
//        label.backgroundColor = .systemYellow
//        label.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
//            label.heightAnchor.constraint(equalToConstant: 52)
//        ])
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])    }
    
}
