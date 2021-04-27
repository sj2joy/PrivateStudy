//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by mac on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {
    
    let itemCount = 100
    let imageView = UIImageView()
    lazy var collectionView = UICollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        collectionView.reloadData()
    }
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 55, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        collectionView = UICollectionView(frame: view.frame.offsetBy(dx: 0, dy: 150), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
    }
}

//MARK: ---UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = [.red, .green, .blue, .magenta, .gray, .cyan, .orange].randomElement()
        return cell
    }
    
}
