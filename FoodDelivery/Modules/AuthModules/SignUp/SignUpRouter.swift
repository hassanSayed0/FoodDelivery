//
//  SignUpRouter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation
import UIKit

class SignUpRouter: PresenterToRouterSignUpProtocol {

    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController : SignUpViewController = SignUpViewController.loadFromStoryboard()
        
        let presenter: ViewToPresenterSignUpProtocol & InteractorToPresenterSignUpProtocol = SignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignUpInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func presentSignIn() {
            
    }
    
    func presentOtp(phone: String, countryCode: String) {
            
    }
    
}
