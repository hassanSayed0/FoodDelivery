//
//  SignUpInteractor.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation

class SignUpInteractor: PresenterToInteractorSignUpProtocol {
    

    // MARK: Properties
    weak var presenter: InteractorToPresenterSignUpProtocol?
    func signUp(_ form: User) {
        AUTH.signUp(form) { [weak presenter] response in
            guard let presenter else {return}
            switch response {
            case let .onSuccess(data):
                print("data from signup \(data)")
            case let .onFailure(error):
                DispatchQueue.main.async {presenter.didFailSignUp(error)}
            case .onCompleted:
                DispatchQueue.main.async {presenter.didSignUp()}
                break
            }
        }
    }

}
