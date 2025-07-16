//
//  SignInRouter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation
import UIKit

class SignInRouter: PresenterToRouterSignInProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController : SignInViewController = SignInViewController.loadFromStoryboard()
        
        let presenter: ViewToPresenterSignInProtocol & InteractorToPresenterSignInProtocol = SignInPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignInRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignInInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return NavController(rootViewController:viewController)
    }
    func presentForgetPassword() {
//        let view = ForgetPasswordRouter.assembleModule()
//        RootRouter().show(viewController: view)
    }
    
    func presentHome() {
//        TAB.selectedIndex = 0
//        RootRouter().rootVC(TAB)
    }
    
    func presentSignUp() {
        let view = SignUpRouter.createModule()
//        RootRouter().popToRoot(animated: false)
        RootRouter().rootVC(view)
    }

}
