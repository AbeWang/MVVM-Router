//
//  BuilderProtocol.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/5.
//

import Foundation

protocol BuilderProtocol {
    associatedtype ViewController
    static func build() -> ViewController
}
