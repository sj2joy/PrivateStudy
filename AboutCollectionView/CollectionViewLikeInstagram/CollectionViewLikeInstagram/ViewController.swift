//
//  ViewController.swift
//  CollectionViewLikeInstagram
//
//  Created by mac on 2021/04/17.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView = UICollectionView()
    let flowLayout = UICollectionViewFlowLayout()
    let models = ["Image-1","Image-2","Image-3","Image-4","Image-5","Image-1","Image-2","Image-3","Image-4","Image-5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
        flowLayout.itemSize = CGSize(width: 150, height: 150)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
    
        collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150 )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
//        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    
}
