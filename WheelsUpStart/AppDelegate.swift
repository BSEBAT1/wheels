//
//  AppDelegate.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.makeKeyAndVisible()

        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

        return UIInterfaceOrientationMask.portrait
    }

}
