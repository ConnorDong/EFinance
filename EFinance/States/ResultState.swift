//
//  ResultState.swift
//  StocksApp
//
//  Created by connor dong on 2021-05-03.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
