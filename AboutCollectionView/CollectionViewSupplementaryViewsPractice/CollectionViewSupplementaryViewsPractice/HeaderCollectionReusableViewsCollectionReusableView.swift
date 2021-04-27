//
//  HeaderCollectionReusableViewsCollectionReusableView.swift
//  CollectionViewSupplementaryViewsPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

class HeaderCollectionReusableViewsCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableViewsCollectionReusableView"
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        imageView.image = UIImage(named: "header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = bounds
        addSubview(imageView)
    }
}

//MARK: - Footer
class FooterCollectionReusableViewsCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableViewsCollectionReusableView"
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .link
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        imageView.image = UIImage(named: "gradient")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = bounds
        addSubview(imageView)

    }
}
