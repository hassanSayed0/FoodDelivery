//
//  User.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

struct User: Codable {
    let name:String?
    let email:String?
    var password: String?
    var confirmPassword: String?
    var phone: String?
}
