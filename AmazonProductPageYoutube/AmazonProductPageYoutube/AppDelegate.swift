//
//  AppDelegate.swift
//  AmazonProductPageYoutube
//
//  Created by mac on 2021/05/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let naviVC = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        return true
    }
}
