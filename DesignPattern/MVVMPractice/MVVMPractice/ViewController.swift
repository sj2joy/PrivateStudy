//
//  ViewController.swift
//  MVVMPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    private var models = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupUI()
    }

    func setupUI() {
        configureModels()
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        tableView.frame = view.bounds

    }
    func configureModels() {
        let names = [
                "SeokJin", "KyuChang", "SeongChan","TaeWon","ByungJu","KyeongMu", "JoongKwon"
        ]
        for name in names {
            models.append(Person(name: name))
        }
    }
}

//MARK: - UITableView
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as! PersonFollowingTableViewCell
        let model = models[indexPath.row]
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: model))
        cell.delegate = self
        return cell
    }
}

//MARK: - CustomDelegate
extension ViewController: PersonFollowingTableViewCellDelegate {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTabWith viewModel: PersonFollowingTableViewCellViewModel) {
        
    }
}
