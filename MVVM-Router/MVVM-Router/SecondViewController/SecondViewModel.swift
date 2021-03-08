//
//  SecondViewModel.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import Foundation

class SecondViewModel {
    private(set) var sectionCount = 2
    
    func textForSection(_ section: Int) -> String {
        return section == 0 ? "A": "B"
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return section == 0 ? 3: 5
    }
}
