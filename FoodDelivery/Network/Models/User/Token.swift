//
//  Token.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import Foundation

class Token: NSObject, NSSecureCoding, Codable {
    static var supportsSecureCoding: Bool = true
    
    var token: String = ""
    var userId: String = ""
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(token, forKey: "token")
        coder.encode(userId, forKey: "userId")
    }
    
    required init?(coder: NSCoder) {
        self.token = coder.decodeObject(forKey: "token") as! String
        self.userId = coder.decodeObject(forKey: "userId") as! String
    }
}
