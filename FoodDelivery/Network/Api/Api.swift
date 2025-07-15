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
            return "https://fawturny.tarseya.tech/api/v1/"
        case .stage:
            return "https://fawturny.tarseya.tech/api/v1/"
        case .release:
            return "https://fawturny.tarseya.tech/api/v1/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
    
    // MARK: - OnBoarding
    
    let SERVICE_ON_BOARDING = "onbording"
    
    // MARK: - AUTH
    
    let SERVICE_USERS_SIGN_IN = "auth/login-phone"
    let SERVICE_USERS_SIGN_UP = "auth/register"
    let SERVICE_USER_VERIFY = "auth/verify"
}
