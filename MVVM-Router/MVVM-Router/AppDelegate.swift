//
//  AppDelegate.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let router = MainRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.start()
        return true
    }
}
