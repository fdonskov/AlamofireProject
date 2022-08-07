//
//  AppDelegate.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 04.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MarvelViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

