//
//  TokenKeyChain.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

class TokenKeyChain: KeyChain {
    
    let key = "TokenKeyChainData"
    
    static var shared = TokenKeyChain()
    
    func save(token: Token) {
        _ = store(key, token)
    }
    
    func get() -> Token? {
        return load(key)
    }
    
    func isExist() -> Bool {
        return get() != nil
    }
    
    func delete() {
        delete(key)
    }
}
