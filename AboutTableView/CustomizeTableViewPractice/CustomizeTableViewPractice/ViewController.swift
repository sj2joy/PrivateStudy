//
//  ViewController.swift
//  CustomizeTableViewPractice
//
//  Created by mac on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds

    }

}
//MARK: -- UITableViewDelegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hi"
        let switchBtn = UISwitch()
        if indexPath.row % 2 == 0 {
            switchBtn.isOn = true
            cell.accessoryView = switchBtn
            cell.backgroundColor = .link
        } else {
            cell.accessoryType = .checkmark
            cell.backgroundColor = .systemYellow
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row & 2 == 0 {
            return 50
        }
        return 100
    }
}
