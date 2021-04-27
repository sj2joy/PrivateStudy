//
//  ViewController.swift
//  MoveTableViewCellPractice
//
//  Created by mac on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var data = ["1st","2nd","3rd","4th","5th"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        let barButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(didTabSortButton(_:)))
        navigationItem.leftBarButtonItem = barButtonItem
    }
   
    @objc private func didTabSortButton(_ sender: UIButton) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}

