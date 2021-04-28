//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by mac on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let models = [
        Person(firstName: "Jang", lastName: "SeokJin", gender: "male", age: 30, height: 178.4),
        Person(firstName: "Kang", lastName: "SeonChan", gender: "male", age: 31, height: 177.7),
        Person(firstName: "Jeon", lastName: "JiHyeon", gender: "female", age: 22, height: 166.7),
        Person(firstName: "Son", lastName: "YeJin", gender: "female", age: 33, height: 158.2)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.addSubview(tableView)
    }
}


//MARK: - UITableView
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let model = models[indexPath.row]
        cell.configure(with: Person(firstName: model.firstName, lastName: model.lastName, gender: model.gender, age: model.age, height: model.height))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


