//
//  HeaderCollectionReusableView.swift
//  CollectionViewHeaderFooterPractice
//
//  Created by mac on 2021/04/17.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableView"
    
    let headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLabel.frame = bounds
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        headerLabel.text = "Header"
        headerLabel.textColor = .white
        headerLabel.backgroundColor = .systemYellow
        headerLabel.textAlignment = .center
        addSubview(headerLabel)
    }
}

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableView"
    
    let footerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerLabel.frame = bounds
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        footerLabel.text = "Footer"
        footerLabel.textColor = .white
        footerLabel.backgroundColor = .systemGreen
        footerLabel.textAlignment = .center
        addSubview(footerLabel)
    }
}
