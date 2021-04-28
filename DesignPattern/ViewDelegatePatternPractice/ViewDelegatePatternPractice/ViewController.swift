//
//  ViewController.swift
//  ViewDelegatePatternPractice
//
//  Created by mac on 2021/04/24.
//

import UIKit

class ViewController: UIViewController, NotificationSettingViewDelegate {
 
    private let notificationViews = NotificationSettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationViews.delegate = self
        view.addSubview(notificationViews)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        notificationViews.frame = CGRect(x: 10,
                                         y: view.safeAreaInsets.top,
                                         width: view.frame.size.width - 20,
                                         height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    func didTabButton() {
        
        let alert = UIAlertController(title: "Enable Notification",
                                      message: "asdfzvsfersaf dvxzvafsfa sdfsafa",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true)
    }
}

protocol NotificationSettingViewDelegate: AnyObject {
    func didTabButton()
}

class NotificationSettingView: UIView {
 
    weak var delegate: NotificationSettingViewDelegate?
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemTeal
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "View Delegate Practice"
        label.textAlignment = .center
        return label
    }()
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Enable Notifications", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(button)
        addSubview(imageView)
        button.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = bounds.size.width / 2
        imageView.frame = CGRect(x: (bounds.size.width - imageSize)/2,
                                 y: 30,
                                 width: imageSize,
                                 height: imageSize)
        label.frame = CGRect(x: 10,
                             y: 30 + imageSize + 20,
                             width: frame.size.width - 20,
                             height: 100)
        button.frame = CGRect(x: 40,
                              y: 160 + imageSize,
                              width: frame.size.width - 80,
                              height: 50)
    }
    
    @objc private func didTabButton(_ sender: UIButton) {
        delegate?.didTabButton()
    }
}
