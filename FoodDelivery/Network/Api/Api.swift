//
//  Api.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

#if DEBUG_DEV
let API = Api(.development)
#elseif DEBUG_STAGE
let API = Api(.stage)
#else
let API = Api(.release)
#endif

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "https://flod.runasp.net/api/"
        case .stage:
            return "https://flod.runasp.net/api/"
        case .release:
            return "https://flod.runasp.net/api/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
    
    // MARK: - OnBoarding
    
    let SERVICE_ON_BOARDING = "onbording"
    
    // MARK: - AUTH
    
    let SERVICE_USERS_SIGN_IN = "Auth/Login"
    let SERVICE_USERS_SIGN_UP = "Auth/SignUp"
    let SERVICE_USER_VERIFY = "Auth/VerifyAccount"
    
    // MARK: - USER
    
    let SERVICE_USER_PROFILE = "profile"
    let SERVICE_USER_LOG_OUT = "auth/logout"
    let SERVICE_USER_FORGET_PASSWORD = "auth/forgot-password"
    let SERVICE_USER_VERIFY_FORGET = "auth/check-verify-code"
    let SERVICE_USER_RESET_PASSWORD = "auth/reset-password"
    let SERVICE_USER_UPDATE = "profile/update"
    let SERVICE_USER_CHANGE_PASSWORD = "profile/password/change"
    let SERVICE_USER_RESEND_CODE = "auth/resend-code"
    let SERVICE_USER_REFRESH_TOKEN = "auth/refresh"
    let SERVICE_USER_DELETE_ACCOUNT = "profile/destroy"
}
