//
//  VerifyForm.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import Foundation
struct VerifyForm: Codable {
    
    var phoneNumber: String?
    var code: String?
 }

extension VerifyForm {
    
    enum CodingKeys: String, CodingKey {
        
        case phoneNumber
        case code 
    }
}
