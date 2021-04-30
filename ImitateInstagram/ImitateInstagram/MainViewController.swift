//
//  ViewController.swift
//  ImitateInstagram
//
//  Created by mac on 2021/04/14.
//

import UIKit

class MainViewController: UIViewController {

    var models                      = [InstagramPost]()
    let tableView                   =  UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        navigationItem.title         = "Instagram"
        tableView.frame              = view.frame
        tableView.dataSource         = self
        tableView.delegate           = self
        tableView.register(PostTableViewCell.self,
                           forCellReuseIdentifier: PostTableViewCell.identifier)
        
        models.append(InstagramPost(numberOfLikes: 200,
                                    userName: "SeokJin",
                                    userImageName: "head",
                                    postImageName: "Image_1"))
        models.append(InstagramPost(numberOfLikes: 130,
                                    userName: "JuMong",
                                    userImageName: "head",
                                    postImageName: "Image_2"))
        models.append(InstagramPost(numberOfLikes: 50,
                                    userName: "KyuChang",
                                    userImageName: "head",
                                    postImageName: "Image_3"))
    }
}

struct InstagramPost {
    let numberOfLikes: Int
    let userName: String
    let userImageName: String
    let postImageName: String
}

//MARK: -- UITableViewDataSource, UITableViewDataSource

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


