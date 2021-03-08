//
//  SecondViewBuilder.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class SecondViewBuilder: BuilderProtocol {
    static func build() -> SecondViewController {
        let viewController = SecondViewController()
        viewController.viewModel = SecondViewModel()
        viewController.router = SecondViewRouter(context: viewController)
        return viewController
    }
}
