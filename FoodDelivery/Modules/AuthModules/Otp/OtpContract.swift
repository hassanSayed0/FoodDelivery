//
//  OtpContract.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewOtpProtocol {
    func showErrorMessage(_ isError:Bool)
    func showLoading()
    func hideLoading()
    func showEstimateTime(_ seconds: Int)
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOtpProtocol {
    
    var view: PresenterToViewOtpProtocol? { get set }
    var interactor: PresenterToInteractorOtpProtocol? { get set }
    var router: PresenterToRouterOtpProtocol? { get set }
    func didClickVerify(_ otp: String)
    func didClickResendCode()
    func returnPhone() -> String
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOtpProtocol {
    
    var presenter: InteractorToPresenterOtpProtocol? { get set }
    func verifyOTP(_ form: VerifyForm)
    func verifyForget(_ from: VerifyForm)
    func resendOTPCode(_ form: VerifyForm)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOtpProtocol:AnyObject {
    func didGetVerify()
    func didFailToGetVerify(_ error:APIError)
    func didVerifyForgetPassword()

    func didResendOTPCode()
    func didFailToResendOTPCode(_ error:APIError)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOtpProtocol {
    func presentHome()
    func presentCreatePassword(_ otp: String)
}
