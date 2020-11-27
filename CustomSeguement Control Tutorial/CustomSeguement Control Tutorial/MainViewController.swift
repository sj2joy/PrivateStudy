//
//  ViewController.swift
//  CustomSeguement Control Tutorial
//
//  Created by mac on 2020/11/06.
//

import UIKit

class MainViewController: UIViewController, MyCustomSegmentControlDelegate {
    func segmentValueChanged(to index: Int) {
        print("MySeguementControl - viewController called, index - \(index)")
        self.label.text = dailyArray[index] + "\n" + dailyCharacterArray[index]
    }
    
    let label = UILabel()
    var dailyArray = ["월요일","화요일","수요일","목요일","금요일","토요일"]
    var dailyCharacterArray = ["🐶","🐱","🐻","🐯","🦊","🐮"]
    
    let myCustomSeguementControl = MyCustomSeguementControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: ["월요일","화요일","수요일","목요일","금요일","토요일"])
     
    override func loadView() {
        super.loadView()
        print("loadView has called ")
        myCustomSeguementControl.mySegmentDelegate = self
        self.view.addSubview(myCustomSeguementControl)
        
        myCustomSeguementControl.translatesAutoresizingMaskIntoConstraints = false
        myCustomSeguementControl.backgroundColor = .systemTeal
        myCustomSeguementControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myCustomSeguementControl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myCustomSeguementControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myCustomSeguementControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemTeal
        setupUI()
    }

    func setupUI() {
        label.font = UIFont(name: "Arial", size: 50)
        label.textAlignment = .center
        label.numberOfLines = 2
//        label.text = "월요일\n🐶"
        label.frame = CGRect(x: view.center.x - 80, y: view.center.y - 60, width: 160, height: 120)
        label.backgroundColor = .yellow
        view.addSubview(label)
    }
}

