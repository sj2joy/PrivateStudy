//
//  AppDelegate.swift
//  ImitateInstagram
//
//  Created by mac on 2021/04/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = MainViewController()
        let naviVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        return true
    }

}
