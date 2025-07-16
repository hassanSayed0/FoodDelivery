//
//  Base+Entity.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import Foundation

protocol TabDelegate {
    func tabToTop()
}

enum BarBtnType {
    case back
    case search
    case delete
}

enum BarDirection {
    case right
    case left
}
