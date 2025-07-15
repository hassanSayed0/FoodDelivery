//
//  AuthService.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import Foundation

extension Api {
    
    enum Auth: ServiceProtocol {
        
        case signIn(_ form: User)
        case signUp(_ form: User)
        case verify(_ otp: String)
        
        var path: String {
            switch self {
            case .signIn:
                return API.SERVICE_USERS_SIGN_IN
            case .signUp:
                return API.SERVICE_USERS_SIGN_UP
            case .verify:
                return API.SERVICE_USER_VERIFY
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .signIn:
                return .POST
            case .signUp:
                return .POST
            case .verify:
                return .POST
                
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .signIn:
                return nil
            case .signUp:
                return nil
            case .verify:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .signIn:
                return nil
            case .signUp:
                return nil
            case .verify:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .signIn(let form):
                return form
            case .signUp(let form):
                return form
            case .verify(let otp):
                return ["verification_key" : otp]
            }
        }
    }
}


