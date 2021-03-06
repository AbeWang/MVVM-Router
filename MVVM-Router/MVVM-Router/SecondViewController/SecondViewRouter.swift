//
//  SecondViewRouter.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class SecondViewRouter: BaseRouter<SecondViewDestination, SecondViewModel> {
    override func route(to destination: SecondViewDestination, viewModel: SecondViewModel? = nil, parameters: [String : Any]? = nil) {
        switch destination {
        case .sectionA:
            context.present(UIViewController.build(), animated: true, completion: nil)
        case .sectionB:
            context.present(UIViewController.build(), animated: true, completion: nil)
        }
    }
}
