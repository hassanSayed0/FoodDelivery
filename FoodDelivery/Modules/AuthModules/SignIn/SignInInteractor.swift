//
//  SignInInteractor.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation

class SignInInteractor: PresenterToInteractorSignInProtocol {

    // MARK: Properties
    weak var presenter: InteractorToPresenterSignInProtocol?
    
    func signIn(_ form :AuthForm) {
        AUTH.signIn(form) { [weak presenter] response in
            guard let presenter else {return}
            switch response {
            case let .onSuccess(token):
                DispatchQueue.main.async {presenter.didGetToken()}
            case let .onFailure(error):
                DispatchQueue.main.async {presenter.didFailToGetToken(error)}
            case .onCompleted:
                break
            }
        }
    }
}
