//
//  OnBoardingContract.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewOnBoardingProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnBoardingProtocol {
    
    var view: PresenterToViewOnBoardingProtocol? { get set }
    var interactor: PresenterToInteractorOnBoardingProtocol? { get set }
    var router: PresenterToRouterOnBoardingProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOnBoardingProtocol {
    
    var presenter: InteractorToPresenterOnBoardingProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOnBoardingProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnBoardingProtocol {
    
}
