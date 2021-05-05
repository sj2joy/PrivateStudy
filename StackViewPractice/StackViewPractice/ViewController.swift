//
//  ViewController.swift
//  StackViewPractice
//
//  Created by mac on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    let label       = UILabel()
    let stackView   = UIStackView()
//    let button      = Button()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureStackView()
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 5
        for i in 1...numberOfButtons {
            let buttons = Button()
            buttons.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(buttons)
        }
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis          = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing       = 20
        addButtonsToStackView()
        stackViewConstraint()
    }
    func stackViewConstraint() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    func configureLabel() {
        view.addSubview(label)
        label.text              = "StackView Practice"
        label.font              = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment     = .center
        label.numberOfLines     = 0
        label.adjustsFontSizeToFitWidth = true
        
        setTitleLableConstraint()
    }
    func setTitleLableConstraint() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}

