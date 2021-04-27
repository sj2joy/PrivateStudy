//
//  ViewController.swift
//  TableViewCellWithCollectionView
//
//  Created by mac on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        models.append(Model(text: "First", imageName: "Image_1"))
        models.append(Model(text: "Second", imageName: "Image_2"))
        models.append(Model(text: "Third", imageName: "Image_3"))
        models.append(Model(text: "Demo", imageName: "Image_4"))
//        models.append(Model(text: "First", imageName: "Image_1"))
//        models.append(Model(text: "Second", imageName: "Image_2"))
//        models.append(Model(text: "Third", imageName: "Image_3"))
//        models.append(Model(text: "Demo", imageName: "Image_4"))
//        models.append(Model(text: "First", imageName: "Image_1"))
//        models.append(Model(text: "Second", imageName: "Image_2"))
//        models.append(Model(text: "Third", imageName: "Image_3"))
//        models.append(Model(text: "Demo", imageName: "Image_4"))

        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
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

//MARK: -- UITableViewDataSource, Delegate

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
