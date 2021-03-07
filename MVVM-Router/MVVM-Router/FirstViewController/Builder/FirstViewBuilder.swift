//
//  FirstViewBuilder.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class FirstViewBuilder: BuilderProtocol {
    static func build() -> FirstViewController {
        let viewController = FirstViewController()
        viewController.viewModel = FirstViewModel()
        viewController.router = FirstViewRouter(context: viewController)
        return viewController
    }
}

extension FirstViewBuilder {
    static func build(backgroundColor: UIColor) -> FirstViewController {
        let viewController = FirstViewBuilder.build()
        viewController.view.backgroundColor = backgroundColor
        return viewController
    }
}
