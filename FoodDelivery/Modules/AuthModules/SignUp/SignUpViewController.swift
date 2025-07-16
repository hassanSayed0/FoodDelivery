//
//  SignUpViewController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import UIKit

class SignUpViewController: BaseController {
    
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var stackViewWhite: UIStackView!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPhoneNUmber: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var imgToggelPassword: UIImageView!
    @IBOutlet weak var txtFldConfirmPassword: UITextField!
    @IBOutlet weak var stackMarkTerms: UIStackView!
    @IBOutlet weak var imgMarkTerms: UIImageView!
    @IBOutlet weak var viewSignFace: UIView!
    @IBOutlet weak var viewSignApple: UIView!
    @IBOutlet weak var viewSignGoogle: UIView!
    @IBOutlet weak var imgToggelConfirmPassword: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    // MARK: - Properties
    var presenter: ViewToPresenterSignUpProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    private func setupView() {
        stackViewMain.cornerRadiusTop(stackViewMain, 20)
        stackViewWhite.cornerRadiusTop(stackViewWhite, 20)
        setupTaps()
    }
    
    func setupTaps() {
        togglePaswordTap()
        toggleConfirmPaswordTap()
        toggleTermsTap()
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
    
    func toggleConfirmPaswordTap() {
        imgToggelConfirmPassword.addAction = {
            self.toggleConfirmPassword()
        }
    }
    
    func toggleConfirmPassword() {
        imgToggelConfirmPassword.isHighlighted = !imgToggelConfirmPassword.isHighlighted
        txtFldConfirmPassword.isSecureTextEntry = !imgToggelConfirmPassword.isHighlighted
    }
    
    func toggleTermsTap() {
        imgMarkTerms.addAction = {
            self.toggleTerms()
        }
    }
    
    func toggleTerms() {
        imgMarkTerms.isHighlighted = !imgMarkTerms.isHighlighted
        handleTextInputChange()
    }
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        view.endEditing(true)
        let form = AuthForm(
            name: txtFldName.text,
            email: txtFldEmail.text,
            password: txtFldPassword.text,
            confirmPassword: txtFldConfirmPassword.text,
            phone: txtFldPhoneNUmber.text
        )
        presenter.didClickSignUp(form)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        presenter.didClickLogin()
    }
    
    @IBAction func actionsTxtFlds(_ sender: UITextField) {
        handleTextInputChange()
    }
    
}

extension SignUpViewController: PresenterToViewSignUpProtocol{
    func showLoading(isBtnLoading: Bool) {
            
    }
    
    func hideLoading() {
            
    }
    
    // TODO: Implement View Output Methods
}
extension SignUpViewController: UITextFieldDelegate {
    
    func handleTextInputChange() {
        if isValid(txtFldName.text, txtFldEmail.text, txtFldPhoneNUmber.text, txtFldPassword.text, txtFldConfirmPassword.text) && imgMarkTerms.isHighlighted {
            toggleBtn(btnSignUp, true)
        } else {
            toggleBtn(btnSignUp, false)
        }
    }
    
    func isValid(_ name: String?, _ email: String?, _ phone: String?, _ password: String?, _ confirmPassword: String?) -> Bool {
        if name?.isEmpty ?? true {
            return false
        } else if email?.isEmpty ?? true {
            return false
        } else if !VALID.isEmail(email) {
            return false
        } else if phone?.isEmpty ?? true {
            return false
        } else if password?.isEmpty ?? true {
            return false
        } else if !VALID.isPassword(password) {
            return false
        }  else if confirmPassword?.isEmpty ?? true {
            return false
        } else if !VALID.isPassword(confirmPassword) {
            return false
        } else if password != confirmPassword {
            return false
        }
        return true
    }
}
