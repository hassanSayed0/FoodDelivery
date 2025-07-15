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
        
        let viewController:OnBoardingViewController = OnBoardingViewController.loadFromNib()
        
        let presenter: ViewToPresenterOnBoardingProtocol & InteractorToPresenterOnBoardingProtocol = OnBoardingPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = OnBoardingRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = OnBoardingInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
