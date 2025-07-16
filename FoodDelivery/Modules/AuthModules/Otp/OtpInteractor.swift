//
//  OtpInteractor.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//  
//

import Foundation

class OtpInteractor: PresenterToInteractorOtpProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterOtpProtocol?

    func verifyOTP(_ form :VerifyForm) {
        AUTH.verify(form) { [weak presenter] response in
            guard let presenter else {return}
            switch response {
            case .onSuccess(_):
                DispatchQueue.main.async {presenter.didGetVerify()}
            case let .onFailure(error):
                DispatchQueue.main.async {presenter.didFailToGetVerify(error)}
            case .onCompleted:
                break
            }
        }
    }
    
    func verifyForget(_ form :VerifyForm) {
        AUTH.verify(form) { response in
            switch response {
            case .onSuccess(_):
                self.presenter?.didVerifyForgetPassword()
            case let .onFailure(error):
                self.presenter?.didFailToGetVerify(error)
            case .onCompleted:
                break
            }
        }
    }
//    func verifyForget(_ form: VerifyForm) {
//        AUTH.forgetPassword(form) { response in
//            switch response {
//            case .onSuccess(_):
//                self.output?.didVerifyForgetPassword()
//            case let .onFailure(error):
//                self.output?.didFailToGetVerify(error)
//            case .onCompleted:
//                break
//            }
//        }
//    }
    
    func resendOTPCode(_ form: VerifyForm) {
        AUTH.resendOTPCode(form) { [weak presenter] response in
            guard let presenter else {return}
            switch response {
            case .onSuccess(_):
                DispatchQueue.main.async {presenter.didResendOTPCode()}
            case let .onFailure(error):
                DispatchQueue.main.async {presenter.didFailToResendOTPCode(error)}
            case .onCompleted:
                DispatchQueue.main.async {presenter.didResendOTPCode()}
                break
            }
        }
    }
}
