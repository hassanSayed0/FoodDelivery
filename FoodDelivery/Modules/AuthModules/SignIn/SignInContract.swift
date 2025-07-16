//
//  SignInContract.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSignInProtocol {
    func showLoading()
    func hideLoading()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSignInProtocol {
    
    var view: PresenterToViewSignInProtocol? { get set }
    var interactor: PresenterToInteractorSignInProtocol? { get set }
    var router: PresenterToRouterSignInProtocol? { get set }
    func didClickForgetPassword()
    func logIn(_ form :AuthForm)
    func didClickRegisterNow()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSignInProtocol {
    
    var presenter: InteractorToPresenterSignInProtocol? { get set }
    func signIn(_ form :AuthForm)

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSignInProtocol :AnyObject {
    func didGetToken()
    func didFailToGetToken(_ error: APIError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSignInProtocol {
    func presentForgetPassword()
    func presentHome()
    func presentSignUp()
}
