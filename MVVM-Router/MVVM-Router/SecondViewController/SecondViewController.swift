//
//  SecondViewController.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

enum SecondViewDestination {
    case sectionA
    case sectionB
}

class SecondViewController: UIViewController {
    var viewModel: SecondViewModel?
    var router: SecondViewRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
