//
//  SignUpPresenter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation

class SignUpPresenter: ViewToPresenterSignUpProtocol {

    // MARK: Properties
    var view: PresenterToViewSignUpProtocol?
    var interactor: PresenterToInteractorSignUpProtocol?
    var router: PresenterToRouterSignUpProtocol?
    
    func didClickLogin() {
        router?.presentSignIn()
    }
    func didClickSignUp(_ form: User) {
        interactor?.signUp(form)
    }
}

extension SignUpPresenter: InteractorToPresenterSignUpProtocol {
    func didFailSignUp(_ error: APIError) {
            
    }
    
    
    func didSignUp() {
            
    }
    
}
