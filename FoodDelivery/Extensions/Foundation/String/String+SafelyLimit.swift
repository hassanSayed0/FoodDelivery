//
//  String+SafelyLimit.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import Foundation

extension String {
    
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String(Array(self).prefix(upTo: n))
    }
}
