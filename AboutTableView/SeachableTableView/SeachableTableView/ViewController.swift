//
//  ViewController.swift
//  SeachableTableView
//
//  Created by mac on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {

    let textfield = UITextField()
    let tableView = UITableView()
    var data = [String]()
    var filteredData =  [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        textfield.delegate = self
        setupData()
        setupUI()
    }
    private func setupData() {
        data.append("Jin")
        data.append("Chang")
        data.append("Mong")
        data.append("Won")
        data.append("Hyeon")
        data.append("Ju")
        data.append("Min")
        data.append("Beom")
    }
    private func setupUI() {
        view.addSubview(textfield)
        textfield.placeholder = "입력해 주세요."
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textfield.heightAnchor.constraint(equalToConstant: 40)
        ])

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}

//MARK: -- UITableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
//MARK: -- UITextfield

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textfield.text {
            filterText(text + string)
        }
        return true
    }
    func filterText(_ query: String) {
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        tableView.reloadData()
        filtered = true
    }
}
