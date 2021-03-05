//
//  FirstViewModel.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import Foundation

class FirstViewModel {
    private(set) var count = 0
    
    let shouldShowAlert = true
    var parameters: [String: Any] {
        return ["name": "abewang", "age": 18, "count": count]
    }
    
    var title: String? {
        didSet {
            titleDidChangedCallback?(title)
        }
    }
    
    // Observation callbacks
    var titleDidChangedCallback: ((String?) -> Void)?
    
    init() {
        increaseTitleCount()
    }
}

extension FirstViewModel {
    func increaseTitleCount() {
        count += 1
        title = String(count)
    }
}
