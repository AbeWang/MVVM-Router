//
//  MainRouter.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class MainRouter {
    private lazy var window = UIWindow(frame: UIScreen.main.bounds)
    
    func start() {
        let firstTabNaviController = createTabBarItemNavigationController(withTitle: "First")
        let secondTabNaviController = createTabBarItemNavigationController(withTitle: "Second")
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstTabNaviController, secondTabNaviController], animated: false)
        
        let firstVC = FirstViewBuilder.build()
        let secondVC = SecondViewBuilder.build()
        firstTabNaviController.pushViewController(firstVC, animated: false)
        secondTabNaviController.pushViewController(secondVC, animated: false)
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}

extension MainRouter {
    private func createTabBarItemNavigationController(withTitle title: String) -> UINavigationController {
        let naviController = UINavigationController()
        naviController.navigationBar.prefersLargeTitles = true
        naviController.navigationItem.largeTitleDisplayMode = .always
        naviController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        return naviController
    }
}
