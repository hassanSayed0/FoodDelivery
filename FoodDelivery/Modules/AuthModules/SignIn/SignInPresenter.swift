//
//  SignInPresenter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import UIKit

class SignInPresenter: ViewToPresenterSignInProtocol {

    // MARK: Properties
    var view: PresenterToViewSignInProtocol?
    var interactor: PresenterToInteractorSignInProtocol?
    var router: PresenterToRouterSignInProtocol?
    func didClickForgetPassword() {
        router?.presentForgetPassword()
    }
    
    func logIn(_ form :AuthForm) {
        view?.showLoading()
        interactor?.signIn(form)
    }
    
    func didClickRegisterNow() {
        DispatchQueue.main.async { [self] in
            router?.presentSignUp()
        }
    }
}

extension SignInPresenter: InteractorToPresenterSignInProtocol {
    func didGetToken() {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
        }
    }
    
    func rootVC(_ vc: UIViewController) {
        APP.window?.makeKeyAndVisible()
        APP.window?.rootViewController = vc
    }
    
    func didFailToGetToken(_ error: APIError) {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            checkError(error)
            
        }
    }
    func checkError(_ error: APIError) {
        switch error.type {
        case .network, .server:
            print("no_internet_connection")
        default:
            if let message = error.message {
                print( message)
            } else if let errors = error.errors {
                switch errors {
                case .strings(let messages):
                    if let message = messages.first {
                        print( message)
                    }
                default:
                    break
                }
            }
        }
    }
}
