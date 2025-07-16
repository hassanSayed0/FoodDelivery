//
//  OtpRouter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//  
//

import Foundation
import UIKit

class OtpRouter: PresenterToRouterOtpProtocol {
    
    // MARK: Static methods
    static func createModule(phone: String ,isForgetPassword: Bool = false) -> UIViewController {
        
        let viewController : OtpViewController = OtpViewController.loadFromStoryboard()
        let interactor = OtpInteractor()
        let router = OtpRouter()
        let presenter = OtpPresenter(view: viewController, interactor: interactor, router: router, phone: phone, isForgetPassword: isForgetPassword)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func presentHome() {
//        TAB.selectedIndex = 0
//        RootRouter().rootVC(TAB)
    }
    
    func presentCreatePassword(_ otp: String) {
//        let view = CreatePasswordRouter.assembleModule(otp)
//        RootRouter().show(viewController: view)
    }

}
