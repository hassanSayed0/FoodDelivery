//
//  SignInViewController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import UIKit

class SignInViewController: BaseController {
    @IBOutlet weak var stackMainView: UIStackView!
    @IBOutlet weak var stackWhiteView: UIStackView!
    @IBOutlet weak var txtFldPhone: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var imgToggelPassword: UIImageView!
    @IBOutlet weak var viewImgFaceBook: UIView!
    @IBOutlet weak var viewImgGoogle: UIView!
    @IBOutlet weak var viewImgApple: UIView!
    @IBOutlet weak var btnSignIn: UIButton!
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterSignInProtocol?
    private func setupView() {
        stackMainView.cornerRadiusTop(stackMainView, 20)
        stackWhiteView.cornerRadiusTop(stackWhiteView, 20)

        txtFldPhone.delegate = self
        togglePaswordTap()
        checkValidation()
    }
    
    func togglePaswordTap() {
        imgToggelPassword.addAction = {
            self.togglePassword()
        }
    }
    
    func togglePassword() {
        imgToggelPassword.isHighlighted = !imgToggelPassword.isHighlighted
        txtFldPassword.isSecureTextEntry = !imgToggelPassword.isHighlighted
    }
    
    func checkValidation() {
        if isValid(txtFldPhone.text, txtFldPassword.text) {
            toggleBtn(btnSignIn, true)
        } else {
            toggleBtn(btnSignIn, false)
        }
    }
    
    func isValid(_ phone: String?, _ password: String?) -> Bool {
        if phone?.isEmpty ?? true {
            return false
        } else if !VALID.isPhone(phone) {
            return false
        } else if password?.isEmpty ?? true {
            return false
        }
        return true
    }

    @IBAction func actionTxtFlds(_ sender: Any) {
        checkValidation()
    }
    
    @IBAction func actionForgetPassword(_ sender: UIButton) {
        presenter?.didClickForgetPassword()
    }
    
    @IBAction func actionSignIn(_ sender: UIButton) {
        view.endEditing(true)
        let form = AuthForm(name: nil ,email : nil,password: txtFldPassword.text,phone: txtFldPhone.text)
        presenter?.logIn(form)
    }
    
    @IBAction func actionRegisterNow(_ sender: UIButton) {
        presenter?.didClickRegisterNow()
    }
}

extension SignInViewController: PresenterToViewSignInProtocol{
    func showLoading() {
//        showRefresher(view: view, isBtnLoading: true)
    }
    
    func hideLoading() {
//        hideRefresher()
    }
}

extension SignInViewController:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case txtFldPhone:
            let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
            guard !text.isEmpty else { return true }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .none
            return numberFormatter.number(from: text)?.intValue != nil
        default:
            return true
        }
    }
}
