//
//  SignUpContract.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSignUpProtocol {
    func showLoading(isBtnLoading: Bool)
    func hideLoading()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSignUpProtocol {
    
    var view: PresenterToViewSignUpProtocol? { get set }
    var interactor: PresenterToInteractorSignUpProtocol? { get set }
    var router: PresenterToRouterSignUpProtocol? { get set }
    func didClickLogin()
    func didClickSignUp(_ form: AuthForm)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSignUpProtocol {
    
    var presenter: InteractorToPresenterSignUpProtocol? { get set }
    func signUp(_ form :AuthForm)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSignUpProtocol:AnyObject {
    func didSignUp(_ form: AuthForm)
    func didFailSignUp(_ error: APIError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSignUpProtocol {
    func presentSignIn()
    func presentOtp(phone: String)
}
