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
    func didClickSignUp(_ form: AuthForm) {
        interactor?.signUp(form)
    }
}

extension SignUpPresenter: InteractorToPresenterSignUpProtocol {
    func didFailSignUp(_ error: APIError) {
        print(error.message)
    }
    
    
    func didSignUp(_ form: AuthForm) {
        router?.presentOtp(phone: form.phone ?? "")
    }
    
}
