//
//  MyCustomTableViewCell.swift
//  CollectionViewTutorial
//
//  Created by mac on 2021/04/16.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    static let identifier = "MyCustomTableViewCell"
    lazy var collectionView = UICollectionView()
    let layout = UICollectionViewFlowLayout()
    var models = [Model]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: contentView.frame.offsetBy(dx: 0, dy: 0), collectionViewLayout: layout)
        collectionView.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: MyCustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.addSubview(collectionView)
    }
}


//MARK: -- UICollectionView
extension MyCustomTableViewCell: UICollectionViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCollectionViewCell.identifier, for: indexPath) as! MyCustomCollectionViewCell
        cell.backgroundColor = .systemTeal
        cell.configure(with: models[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
