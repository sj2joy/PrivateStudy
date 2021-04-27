//
//  ViewController.swift
//  TableViewHeaderSectionPractice
//
//  Created by mac on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .grouped)
    
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
//MARK: -- UITableViewDelegate
extension ViewController: UITableViewDelegate {

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section Title: \(section)"
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section % 2 != 0 {
            return nil
        }
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .secondarySystemGroupedBackground
        
        let imageView = UIImageView(image: UIImage(systemName: "house"))
        imageView.frame = CGRect(x: 5, y: 5, width: header.frame.size.height - 10, height: header.frame.size.height - 10)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        header.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: imageView.frame.size.width + 10, y: 5,
                                          width: header.frame.size.width - 15 - imageView.frame.size
                                            .width, height: header.frame.size.height - 10))
        label.text = "Custom Section Header: \(section)"
        label.font = .systemFont(ofSize: 22, weight: .thin)
        header.addSubview(label)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}

//MARK: -- UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World: section: \(indexPath.section) | row: \(indexPath.row)"
        
        return cell
    }
}

