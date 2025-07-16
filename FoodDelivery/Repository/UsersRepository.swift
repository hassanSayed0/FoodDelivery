//
//  UsersRepository.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import UIKit

let USER = UsersRepository.shared

class UsersRepository: Repo {
    
    let token = TokenKeyChain.shared
    
    static let shared = UsersRepository()
    
     
    func isExist() -> Bool {
        return token.isExist()
    }
}


