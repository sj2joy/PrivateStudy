//
//  ViewController.swift
//  zvlkvklzxv
//
//  Created by mac on 2020/10/25.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(PracticeCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
        
}
//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        (cell as! PracticeCell).titleLabel.text = String(infoData[indexPath.row].name)
        (cell as! PracticeCell).subLabel.text = String(infoData[indexPath.row].age)
        (cell as! PracticeCell).animalImage.image = UIImage(named: "bear")
      
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personInfo = infoData[indexPath.row]

        print("\(personInfo.age)")
    }
}
