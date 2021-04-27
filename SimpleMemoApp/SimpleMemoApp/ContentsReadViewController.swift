//
//  ContentsReadViewController.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/26.
//

import UIKit

class ContentsReadViewController: UIViewController {
    
    var models: MemoModel?
    let titleLabel = UILabel()
    let contentsLabel = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setconstraint()
    }
    
    func setconstraint() {
        view.addSubview(titleLabel)
        titleLabel.text = models?.title
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.borderColor = UIColor.gray.cgColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.9),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        view.addSubview(contentsLabel)
        contentsLabel.text = models?.contents
        contentsLabel.layer.borderWidth = 2
        contentsLabel.layer.borderColor = UIColor.gray.cgColor
        contentsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentsLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            contentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            contentsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentsLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.9),
            contentsLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        view.addSubview(imageView)
        imageView.image = models?.image
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentsLabel.bottomAnchor, constant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.9),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.5)
        ])
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (models?.date)!)
        self.navigationItem.title = dateString
    }
    
}

