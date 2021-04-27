//
//  ViewController.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/25.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let userInfo = UserInfoManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginAlert()
        title = "List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemoTitleCell.self, forCellReuseIdentifier: MemoTitleCell.identifier)
        tableView.register(MemoContentsCell.self, forCellReuseIdentifier: MemoContentsCell.identifier)
        let barButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTabButton(_:)))
        self.navigationItem.rightBarButtonItem = barButton
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    func loginAlert() {
        let alert = UIAlertController(title: "LogIn", message: nil, preferredStyle: .alert)
        alert.addTextField { (action) in
            action.placeholder = "ID를 입력해주세요"
        }
        alert.addTextField { (action) in
            action.placeholder = "PassWord를 입력해주세요"
            action.isSecureTextEntry = true
        }
        let loginAction = UIAlertAction(title: "Login", style: .destructive) { (action) in
            let account = alert.textFields?[0].text ?? ""
            let password = alert.textFields?[1].text ?? ""
            if self.userInfo.login(account: account, password: password) {
                
            }else {
                let message = "로그인에실패하였습니다."
                let alert = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: false)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addAction(loginAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: false)
    }
    @objc private func didTabButton(_ sender: UIBarButtonItem) {
        print("asdfdf")
        let contentsVC = ContentsViewController()
        //        present(contentsVC, animated: true, completion: nil)
        navigationController?.pushViewController(contentsVC, animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memoList.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.memoList[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if row.image == nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: MemoTitleCell.identifier) as! MemoTitleCell
            cell.titleLabel.text = row.title
            cell.contentLabel.text = row.contents
            cell.dateLabel.text = formatter.string(from: row.date!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MemoContentsCell.identifier) as! MemoContentsCell
            cell.titleLabel.text = row.title
            cell.contentLabel.text = row.contents
            cell.imageView?.image = row.image
            cell.dateLabel.text = formatter.string(from: row.date!)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let readVC = ContentsReadViewController()
        let row = appDelegate.memoList[indexPath.row]
        readVC.models = row
        navigationController?.pushViewController(readVC, animated: true)
    }
    
}
