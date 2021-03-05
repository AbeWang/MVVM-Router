//
//  FirstViewRouter.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class FirstViewRouter: BaseRouter<FirstViewDestination, FirstViewModel> {
    override func route(to destination: FirstViewDestination, viewModel: FirstViewModel? = nil, parameters: [String : Any]? = nil) {
        switch destination {
        case .viewA:
            context.navigationController?.pushViewController(UIViewController.build(), animated: true)
        case .viewB:
            if let viewModel = viewModel, viewModel.shouldShowAlert, let parameters = parameters {
                let title = "Parameters"
                let message = "name: \(parameters["name"] ?? "")\nage: \(parameters["age"] ?? 0)"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Show View", style: .default, handler: { [weak self] _ in
                    self?.context.present(UIViewController.build(), animated: true, completion: nil)
                }))
                context.present(alert, animated: true, completion: nil)
            }
        case .viewC:
            context.present(UIViewController.build(), animated: true, completion: nil)
        }
    }
}
