//
//  OtpViewController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//  
//

import UIKit

class OtpViewController: BaseController {
    
    @IBOutlet weak var stackOtp: OTPStackView!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var stackError: UIStackView!
    @IBOutlet weak var btnResendCode: UIButton!
    @IBOutlet weak var btnVerify: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        stackOtp.delegate = self
        stackOtp.addOTPFields()
        toggleBtn(btnVerify, false)
    }

    // MARK: - Properties
    var presenter: ViewToPresenterOtpProtocol?
    @IBAction func actionVerify(_ sender: UIButton) {
        presenter?.didClickVerify(stackOtp.getOTP())
    }
    
    @IBAction func actionResendCode(_ sender: UIButton) {
        presenter?.didClickResendCode()
    }
}

extension OtpViewController: PresenterToViewOtpProtocol{
    func showLoading() {
        showRefresher(view: view, isBtnLoading: true)
    }
    
    func hideLoading() {
        hideRefresher()
    }
    
    func showEstimateTime(_ seconds: Int) {
        if seconds != 0 {
            toggleBtn(btnResendCode, false)
            lblTimer.text = "\(seconds) \("second")"
            showErrorMessage(false)
            
        } else {
            lblTimer.text = "0"
            toggleBtn(btnResendCode, true)
            showErrorMessage(true)
        }
    }
    
    func showErrorMessage(_ isError:Bool) {
        stackError.isHidden = !isError
        stackOtp.setAllFieldColor(isWarningColor: isError )
    }
}
extension OtpViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
        toggleBtn(btnVerify, isValid)
    }
}
