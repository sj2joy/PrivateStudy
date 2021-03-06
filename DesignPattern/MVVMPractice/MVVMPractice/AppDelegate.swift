//
//  AppDelegate.swift
//  MVVMPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let mainVC = ViewController()
        let naviVC = UINavigationController(rootViewController: mainVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        return true
    }
}
