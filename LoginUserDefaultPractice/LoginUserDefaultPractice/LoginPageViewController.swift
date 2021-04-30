//
//  LoginPageViewController.swift
//  LoginUserDefaultPractice
//
//  Created by mac on 2021/04/09.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController {
    
    let label = UILabel()
    let logOutBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        setupUI()
    }
    func setupUI() {
        label.text = "WelCome"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(label)
        
        logOutBtn.setTitle("LogOut", for: .normal)
        logOutBtn.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        logOutBtn.titleLabel?.textAlignment = .center
        logOutBtn.addTarget(self, action: #selector(didTabBackBtn(_:)), for: .touchUpInside)
        view.addSubview(logOutBtn)
        autoLayout()
    }
    func autoLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            label.heightAnchor.constraint(equalToConstant: 70)
        ])
        logOutBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            logOutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            logOutBtn.widthAnchor.constraint(equalToConstant: 100),
            logOutBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    @objc private func didTabBackBtn(_ sender: UIButton) {
        UserDefaults.standard.setValue(false, forKey: "ISUSERLOGIN")
        
        print("Log Out")
        dismiss(animated: true, completion: nil)
        
    }
}
