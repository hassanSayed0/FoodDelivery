//
//  UsersService.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import Foundation

extension Api {
    
    enum Users: ServiceProtocol {
        
        case profile
        case logout
        case forgetPassword(_ form: VerifyForm)
        case resendOTPCode(_ form: VerifyForm)
//        case resetPassword(_ form: PasswordForm)
        case resetPassword(_ form: String)
        case update(_ user: AuthForm)
        case changePassword(_ form: String)
//        case changePassword(_ form: PasswordForm)
        case resendCode(_ email: String)
        case deleteAccount
        case refreshToken
        
        var path: String {
            switch self {
            case .profile:
                return API.SERVICE_USER_PROFILE
            case .logout:
                return API.SERVICE_USER_LOG_OUT
            case .forgetPassword:
                return API.SERVICE_USER_FORGET_PASSWORD
            case .resendOTPCode:
                return API.SERVICE_USER_RESEND_CODE
            case .resetPassword:
                return API.SERVICE_USER_RESET_PASSWORD
            case .update:
                return API.SERVICE_USER_PROFILE
            case .changePassword:
                return API.SERVICE_USER_CHANGE_PASSWORD
            case .resendCode:
                return API.SERVICE_USER_RESEND_CODE
            case .refreshToken:
                return API.SERVICE_USER_REFRESH_TOKEN
            case .deleteAccount:
                return API.SERVICE_USER_DELETE_ACCOUNT
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .profile:
                return .GET
            case .logout:
                return .POST
            case .forgetPassword:
                return .POST
            case .resendOTPCode:
                return .POST
            case .resetPassword:
                return .POST
            case .update:
                return .POST
            case .changePassword:
                return . POST
            case .resendCode:
                return .POST
            case .refreshToken:
                return .POST
            case .deleteAccount:
                return .POST
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .profile:
                return nil
            case .logout:
                return nil
            case .forgetPassword:
                return nil
            case .resendOTPCode:
                return nil
            case .resetPassword:
                return nil
            case .update:
                return nil
            case .changePassword:
                return nil
            case .resendCode:
                return nil
            case .refreshToken:
                return nil
            case .deleteAccount:
                return nil
                
            }
        }
        
        var headers: Headers? {
            switch self {
            case .profile:
                return nil
            case .logout:
                return nil
            case .forgetPassword:
                return nil
            case .resendOTPCode:
                return nil
            case .resetPassword:
                return nil
            case let .update(form):
//                if form.photos?[0] != nil {
//                    return [APIHeader.contentType.rawValue: APIHeader.mutliPart.rawValue+form.boundary!, APIHeader.contentLenght.rawValue: "\(form.uploadImage().count)"]
//                }
                return nil
            case .changePassword:
                return nil
            case .resendCode:
                return nil
            case .refreshToken:
                return nil
            case .deleteAccount:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .profile:
                return nil
            case .logout:
                return nil
            case let .forgetPassword(form):
                return form
            case let .resendOTPCode(form):
                return form
            case let .resetPassword(form):
                return form
            case let .update(form):
//                if form.photos?[0] != nil {
//                    return form.uploadImage()
//                } else {
                    return form
//                }
            case let .changePassword(form):
                return form
            case let .resendCode(email):
                return ["email": email]
            case .refreshToken:
                return nil
            case .deleteAccount:
                return nil
            }
        }
    }
}


