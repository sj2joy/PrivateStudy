//
//  AppDelegate.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/25.
//

import UIKit
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var memoList = [MemoModel]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let naviVC = UINavigationController(rootViewController: MainViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = naviVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
}
