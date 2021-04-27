//
//  ViewController.swift
//  CollectionViewCompositionalLayoutPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createLayout())
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
//        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        flowLayout.scrollDirection = .vertical
//        flowLayout.itemSize = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        flowLayout.minimumLineSpacing = 1
//        flowLayout.minimumInteritemSpacing = 1
        
       
        collectionView.frame = view.bounds
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCustomCollectionCellCollectionViewCell.self, forCellWithReuseIdentifier: MyCustomCollectionCellCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    static func createLayout() -> UICollectionViewCompositionalLayout {
        //Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        //Group
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                   heightDimension: .fractionalHeight(1)),
                                                                  subitem: verticalStackItem,
                                                                  count: 2)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(3/5)), subitems: [
                item, verticalStackGroup
        ])
        
        //Sections
        let section = NSCollectionLayoutSection(group: group)
        //Returns
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - CollectionView

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCollectionCellCollectionViewCell.identifier, for: indexPath) as! MyCustomCollectionCellCollectionViewCell
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.size.width / 3) - 4, height: view.frame.size.width / 2)
//    }
}
