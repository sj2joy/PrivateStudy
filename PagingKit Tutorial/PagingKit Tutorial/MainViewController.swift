//
//  ViewController.swift
//  PagingKit Tutorial
//
//  Created by mac on 2020/11/05.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit
import PagingKit

class MainViewController: UIViewController {
    
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
     
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
    var dataSource = [(menuTitle: "Test1", vc: viewController(.red)), (menuTitle: "Test2", vc: viewController(.blue)), (menuTitle: "Test3", vc: viewController(.yellow))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.register(type: TitleLabelMenuViewCell.self, forCellWithReuseIdentifier: "MenuViewCell") // 이건 라이브러리에서 기본 제공해주는것(아래 쪽에 있음)
//        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        menuViewController.registerFocusView(view: UnderlineFocusView()) // 이것도 라이브러리 기본제공되는 것
        menuViewController.cellAlignment = .center
        menuViewController.reloadData()
        contentViewController.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self

        }
    }
    
}

//MARK: - PagingMenuViewControllerDataSource
extension MainViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
//        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuViewCell", for: index) as! TitleLabelMenuViewCell   // 이건 라이브러리에서 기본 제공해주는것(아래 쪽에 있음)
        cell.titleLabel.text = dataSource[index].menuTitle
        cell.titleLabel.textColor = .black
        return cell
    }
}
//MARK: - PagingMenuViewControllerDelegate

extension MainViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

//MARK: - PagingContentViewControllerDataSource

extension MainViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
}

//MARK: - PagingContentViewControllerDelegate

extension MainViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
