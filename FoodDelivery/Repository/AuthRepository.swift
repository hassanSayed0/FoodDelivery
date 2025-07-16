//
//  AuthRepository.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import Foundation

let AUTH = AuthRepository.shared

class AuthRepository: Repo {
    
    let token = USER.token

    static let shared = AuthRepository()
   
    func signIn(_ form: AuthForm,_ completion: @escaping (Response<Token>) -> ()) {
        provider.request(type: Token?.self, service: Api.Auth.signIn(form)) { response in
            switch response {
            case let .success(token):
                if let token = token {
                    self.token.save(token: token)
                    completion(.onSuccess(token))
                }
            case let .failure(error):
                completion(.onFailure(error))
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
    
    func signUp(_ form: AuthForm,_ completion: @escaping (Response<AnyCodable?>) -> ()) {
        provider.request(type: AnyCodable?.self, service: Api.Auth.signUp(form)) { response in
            switch response {
            case let .success(data):
                completion(.onSuccess(data))
            case let .failure(error):
                completion(.onFailure(error))
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
    func resendOTPCode(_ form: VerifyForm, _ completion: @escaping (Response<AnyCodable>) -> ()) {
        provider.request(type: AnyCodable.self, service: Api.Users.resendOTPCode(form)) { response in
            switch response {
            case let .success(any):
                completion(.onSuccess(any))
            case let .failure(error):
                completion(.onFailure(error))
            case .complete:
                completion(.onCompleted)
            }
        }
    }
    
    func verify(_ otp: String, _ completion: @escaping (Response<Token>) -> ()) {
        provider.request(type: Token.self, service: Api.Auth.verify(otp)) { response in
            switch response {
            case .success(let token):
                self.token.save(token: token)
                completion(.onSuccess(token))
            case let .failure(error):
                completion(.onFailure(error))
            case .complete:
                completion(.onCompleted)
            }
        }
    }
    
  
}
