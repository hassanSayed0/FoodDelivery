//
//  OnBoardingRouter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation
import UIKit

class OnBoardingRouter: PresenterToRouterOnBoardingProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController:OnBoardingViewController = OnBoardingViewController.loadFromStoryboard()
        let router = OnBoardingRouter()
        let interactor = OnBoardingInteractor()
        let presenter = OnBoardingPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    func presentSignIn() {
        let view = SignInRouter.createModule()
        RootRouter().rootVC(view)
    }
}
