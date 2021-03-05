//
//  BaseRouter.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

class BaseRouter<Destination, ViewModel> {
    unowned let context: UIViewController
    
    init(context: UIViewController) {
        self.context = context
    }
    
    func route(to destination: Destination, viewModel: ViewModel? = nil, parameters: [String: Any]? = nil) {
        assert(true, "Should be implemented by subclasses")
    }
}
