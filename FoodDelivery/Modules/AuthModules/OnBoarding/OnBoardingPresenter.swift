//
//  OnBoardingPresenter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation

class OnBoardingPresenter: ViewToPresenterOnBoardingProtocol {

    // MARK: Properties
    var view: PresenterToViewOnBoardingProtocol?
    var interactor: PresenterToInteractorOnBoardingProtocol?
    var router: PresenterToRouterOnBoardingProtocol?
}

extension OnBoardingPresenter: InteractorToPresenterOnBoardingProtocol {
    
}
