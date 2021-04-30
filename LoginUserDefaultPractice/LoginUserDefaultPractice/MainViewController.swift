//
//  ViewController.swift
//  LoginUserDefaultPractice
//
//  Created by mac on 2021/04/09.
//

import UIKit

class MainViewController: UIViewController {
    
    let label = UILabel()
    let IdTextfield = UITextField()
    let passwordTextField = UITextField()
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        passwordTextField.delegate = self
//        navigationController?.navigationBar.isHidden = true
        if UserDefaults.standard.bool(forKey: "ISUSERLOGIN") == true {
            if IdTextfield.text == "Test" && passwordTextField.text == "Test" {
                let loginVC = LoginPageViewController()
                present(loginVC, animated: true, completion: nil)
                print("Login Success")
            }
        }
    }
    func setupUI() {
        label.text = "UserDefaults Tutorial"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.backgroundColor = .yellow
        view.addSubview(label)
        
        IdTextfield.backgroundColor = .systemBackground
        IdTextfield.borderStyle = .roundedRect
        IdTextfield.placeholder = "ID를 입력해주세요"
        view.addSubview(IdTextfield)
        
        passwordTextField.backgroundColor = .systemBackground
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
        
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        view.addSubview(btn)
        autoLayout()
        
    }
    func autoLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 60),
        ])
        IdTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            IdTextfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            IdTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            IdTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            IdTextfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: IdTextfield.bottomAnchor, constant: 70),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btn.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    @objc private func didTabButton(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "ISUSERLOGIN")
        
        if IdTextfield.text == "Test" && passwordTextField.text == "Test" {
            let loginVC = LoginPageViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
            print("Login Success")
        } else {
            print("Login Failure")
        }
        IdTextfield.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        print("click")
        didTabButton(btn)
        return true
    }
}
