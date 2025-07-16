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
        
        return NavController(rootViewController:viewController)
    }
    
    func presentSignIn() {
        let view = SignInRouter.createModule()
        RootRouter().rootVC( view)
    }
    
    func presentOtp(phone: String) {
        let view = OtpRouter.createModule(phone: phone)
        RootRouter().show(viewController: view)
    }
    
}
