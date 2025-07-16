//
//  AuthForm.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

struct AuthForm: Codable {
//    let status:String
    let name:String?
    let email:String?
    var password: String?
    var confirmPassword: String?
    var phone: String?
}
extension AuthForm {
    
    enum CodingKeys: String, CodingKey {
//        case status
        case name
        case password
        case email
        case confirmPassword 
        case phone = "mobileNumber"
    }
}
