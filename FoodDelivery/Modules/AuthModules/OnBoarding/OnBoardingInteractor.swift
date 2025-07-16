//
//  OnBoardingInteractor.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import Foundation

class OnBoardingInteractor: PresenterToInteractorOnBoardingProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterOnBoardingProtocol?
    func getOnBoarding() {
        let onBoarding : [OnBoarding] = [
            .init(
                image: "onboarding1",
                title: "The latest products you will find here",
                description: "You can find multi stores and multi products for each store."
            )
            ,.init(
                image: "onboarding1",
                title: "The biggest stores you will find here",
                description: "You can see the details of each store and each product and see the rating for them to can determine what is suitable for you."
            )
            ,.init(
                image: "onboarding3",
                title: "Buying products with loyalty points",
                description: ""
            )
        ]
        self.presenter?.didGetOnBoarding(onBoarding)
    }
}
