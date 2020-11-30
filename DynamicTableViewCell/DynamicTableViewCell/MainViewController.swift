//
//  ViewController.swift
//  DynamicTableViewCell
//
//  Created by mac on 2020/11/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
     
        "asxcvjklsjldlsjldlsjldlsjldlsjldlssxcvjklsjldlsjldlsjldlsjldlsjldlssxcvjklsjldlsjldlsjldlsjldlsjldlssxcvjklsjldlsjldlsjldlsjldlsjldlssxcvjklsjldlsjldlsjldlsjldlsjldlsjlds",
        "리버풀",
        "첼시",
        "아스날",
        "맨유",
        "레알마드리드",
    ]
    
    //두개는 같은거
//    let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
    let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        myTableView.rowHeight = UITableView.automaticDimension //높이를 자동으로 잡아주는
        myTableView.estimatedRowHeight = 120 //어느정도 예상되는 값을 넣을 때 사용
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}
//MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        cell.userContentLabel.text = contentArray[indexPath.row]
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
}
