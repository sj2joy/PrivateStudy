//
//  ViewController.swift
//  TableViewHeaderFooterPractice
//
//  Created by mac on 2021/04/14.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let tableView = UITableView()
    let data = [
        ["apple","melon","peach"],
        ["one","two","three"],
        ["jin","mong"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        header.backgroundColor = .orange
        footer.backgroundColor = .systemTeal
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        
        label.text = "Hello"
        label.frame = header.bounds
        label.textAlignment = .center
        header.addSubview(label)
    }
}

//MARK: -- UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: -- UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        header.backgroundColor = .systemBackground
        return header
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
    }

}
