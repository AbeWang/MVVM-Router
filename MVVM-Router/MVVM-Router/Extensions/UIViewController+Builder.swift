//
//  UIViewController+Builder.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/5.
//

import UIKit

extension UIViewController {
    static func build() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        return viewController
    }
    
    static func build(title: String) -> UIViewController {
        let viewController = UIViewController.build()
        viewController.title = title
        return viewController
    }
}
