//
//  ViewController.swift
//  SimpleJSONParsingPractice
//
//  Created by mac on 2021/05/02.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let networkManager = NetworkManager()
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getDustData { data in
            self.contacts = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.addSubview(tableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = "name: \(contacts[indexPath.row].name)"
        cell.emailLabel.text = "email: \(contacts[indexPath.row].email)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

