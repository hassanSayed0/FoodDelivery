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
    private var onBoarding: [OnBoarding]?
    private var currentRow: Int = 0 {
        didSet {
            view?.scrollToNextBoarding(onBoarding?[currentRow])
        }
    }
    init(view: PresenterToViewOnBoardingProtocol?, interactor: PresenterToInteractorOnBoardingProtocol, router: PresenterToRouterOnBoardingProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getOnBoarding() {
        view?.showLoading()
        interactor?.getOnBoarding()
    }
    
    func didClickToSkip() {
        router?.presentSignIn()
        UserDefaults.standard.set(true, forKey: "onboardingCompleted")
    }
    
    func onBoardingImageCount() -> Int {
        onBoarding?.count ?? 0
    }
    
    func getCurrentRow() -> Int {
        return currentRow
    }
    
    func didChangeCurrentRow() {
        if currentRow ==  onBoardingImageCount() - 1 {
            router?.presentSignIn()
            UserDefaults.standard.set(true, forKey: "onboardingCompleted")
        } else {
            currentRow += 1
        }
    }

}

extension OnBoardingPresenter: InteractorToPresenterOnBoardingProtocol {
    func didGetOnBoarding(_ onBoarding: [OnBoarding]) {
        DispatchQueue.main.async { [self] in
            self.onBoarding = onBoarding
            view?.scrollToNextBoarding(onBoarding.first)
            view?.dismissNetworkError()
            view?.hideLoading()
        }
    }
    
    func didFailToGetOnBoarding(_ error: APIError) {
        checkError(error)
    }
    
    func checkError(_ error: APIError) {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            view?.presentNetworkError()
        }
    }
}
