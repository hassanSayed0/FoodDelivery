//
//  Double+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import Foundation

extension Double {
    
    func rounded(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
