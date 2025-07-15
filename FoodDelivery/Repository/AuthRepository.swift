//
//  AuthRepository.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import Foundation

let AUTH = AuthRepository.shared

class AuthRepository: Repo {
    
    
    static let shared = AuthRepository()
   
    
    func signUp(_ form: User,_ completion: @escaping (Response<AnyCodable?>) -> ()) {
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
    
  
}
