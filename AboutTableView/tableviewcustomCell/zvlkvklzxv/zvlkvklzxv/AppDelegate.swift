//
//  AppDelegate.swift
//  zvlkvklzxv
//
//  Created by mac on 2020/10/25.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        return true
    }
}
