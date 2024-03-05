//
//  AppDelegate.swift
//  BrandButtonExample
//
//  Created by Pouya Yarandi on 3/1/24.
//

import UIKit
import SwiftUI
import BrandButton

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = UITabBarController()

        tabBar.setViewControllers([
            ViewController(), // UIKit
            UIHostingController(rootView: SwiftUIView()) // SwiftUI
        ], animated: false)

        tabBar.tabBar.items?[0].title = "UIKit"
        tabBar.tabBar.items?[1].title = "SwiftUI"

        tabBar.tabBar.items?[0].image = UIImage(systemName: "swift")
        tabBar.tabBar.items?[1].image = UIImage(systemName: "swift")

        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()

        return true
    }

}
