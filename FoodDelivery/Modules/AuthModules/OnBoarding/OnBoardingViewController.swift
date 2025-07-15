//
//  OnBoardingViewController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterOnBoardingProtocol?
    
}

extension OnBoardingViewController: PresenterToViewOnBoardingProtocol{
    // TODO: Implement View Output Methods
}
