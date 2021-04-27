//
//  ViewController.swift
//  CollectionViewInTableViewPractice
//
//  Created by mac on 2021/04/16.
//

import UIKit

class MainViewController: UIViewController {

    let tableView = UITableView()
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models.append(Model(text: "First", imageName: "Image_1"))
        models.append(Model(text: "Second", imageName: "Image_2"))
        models.append(Model(text: "Third", imageName: "Image_3"))
        models.append(Model(text: "First", imageName: "Image_1"))
        models.append(Model(text: "Second", imageName: "Image_2"))
        models.append(Model(text: "Third", imageName: "Image_3"))

        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}
struct Model {
    let text: String
    let imageName: String
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}
//MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(with: models)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}
