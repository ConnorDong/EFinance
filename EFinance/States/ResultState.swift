//
//  ResultState.swift
//  EFinance
//
//  Created by connor dong on 2021-05-05.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
