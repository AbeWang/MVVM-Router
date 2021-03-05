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
        viewController.title = "View"
        viewController.view.backgroundColor = .blue
        return viewController
    }
}
