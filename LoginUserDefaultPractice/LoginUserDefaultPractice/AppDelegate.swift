//
//  AppDelegate.swift
//  LoginUserDefaultPractice
//
//  Created by mac on 2021/04/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainVC = MainViewController()
//        let naviVC = UINavigationController(rootViewController: mainVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemTeal
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        return true
    }

}
