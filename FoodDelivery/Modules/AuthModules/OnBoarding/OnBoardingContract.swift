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
    func scrollToNextBoarding(_ protocol: OnBoardingElementsProtocols?)
    func showLoading()
    func hideLoading()
    func presentNetworkError()
    func dismissNetworkError()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnBoardingProtocol {
    
    var view: PresenterToViewOnBoardingProtocol? { get set }
    var interactor: PresenterToInteractorOnBoardingProtocol? { get set }
    var router: PresenterToRouterOnBoardingProtocol? { get set }
    func onBoardingImageCount() -> Int
    func getCurrentRow() -> Int
    func didClickToSkip()
    func didChangeCurrentRow()
    func getOnBoarding()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOnBoardingProtocol {
    
    var presenter: InteractorToPresenterOnBoardingProtocol? { get set }
    func getOnBoarding()

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOnBoardingProtocol {
    func didGetOnBoarding(_ onBoarding: [OnBoarding])
    func didFailToGetOnBoarding(_ error: APIError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnBoardingProtocol {
    func presentSignIn()

}
