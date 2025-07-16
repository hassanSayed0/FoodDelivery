//
//  OtpPresenter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//  
//

import Foundation

class OtpPresenter: ViewToPresenterOtpProtocol {

    // MARK: Properties
    var view: PresenterToViewOtpProtocol?
    var interactor: PresenterToInteractorOtpProtocol?
    var router: PresenterToRouterOtpProtocol?
    
    private var phone = ""
    private var isForgetPassword: Bool = false
    private var timer: Timer?
    private var runCount: Int = 120
    private var otp = ""
    
    init(view: PresenterToViewOtpProtocol?, interactor: PresenterToInteractorOtpProtocol, router: PresenterToRouterOtpProtocol, phone: String, isForgetPassword: Bool) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.phone = phone
        self.isForgetPassword = isForgetPassword
        setupTimer()
    }
    
    func setupTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
      }
      
      @objc func fireTimer() {
          runCount -= 1
          if runCount == 0 {
              timer?.invalidate()
          }
          view?.showEstimateTime(runCount)
      }
    func returnPhone() -> String {
           return phone
       }
    func didClickVerify(_ otp: String) {
        view?.showLoading()
        if !isForgetPassword {
            interactor?.verifyOTP(.init(phoneNumber: phone,code: otp))
        } else {
//            interactor.verifyForget(VerifyForm(phone: phone, code: countryCode))
            interactor?.verifyForget(.init(phoneNumber: phone,code: otp))
            self.otp = otp
        }
    }
    
    func didClickResendCode() {
        view?.showLoading()
        interactor?.resendOTPCode(.init(phoneNumber: phone))
    }
}

extension OtpPresenter: InteractorToPresenterOtpProtocol {
    func didGetVerify() {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            router?.presentHome()
            print("the_account_has_been_created_successfully")
        }
    }
    
    func didFailToGetVerify(_ error: APIError) {
        DispatchQueue.main.async { [self] in
            view?.showErrorMessage(true)
            checkError(error)
        }
    }
    
    func didVerifyForgetPassword() {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            print("Phone_has_been_verified_successfully")
            router?.presentCreatePassword(otp)
        }
    }
    func didResendOTPCode() {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            runCount = 120
            setupTimer()
        }
    }
    
    func didFailToResendOTPCode(_ error: APIError) {
        DispatchQueue.main.async { [self] in
            checkError(error)
        }
    }
    
    func checkError(_ error: APIError) {
        view?.hideLoading()
        switch error.type {
        case .network:
            print( "no_internet_connection")
        default:
            if let message = error.message {
               print( message)
            } else {
              print("verification_code_is_wrong")
            }
        }
    }
}
