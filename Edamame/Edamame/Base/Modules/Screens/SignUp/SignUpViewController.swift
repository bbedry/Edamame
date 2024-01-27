//
//  SignUpViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 25.01.2024.
//

import UIKit

protocol SignUpControllerProtocolHandler {
    func validateEmailAddress(_ email: String?) throws
    func validatePassword(_ pass: String) throws
    func performSignUp(_ email: String?, _ pass: String?) throws
}

protocol SignUpControllerProtocol: AnyObject {
    var handler: SignUpControllerProtocolHandler? { get set }
    
    func showEmailError(_ error: String)
    func showPasswordError(_ error: String)
}


final class SignUpViewController: UIViewController, SignUpControllerProtocol {
    
    
    var handler: SignUpControllerProtocolHandler?
    
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkCharactersCountImage: UIImageView!
    @IBOutlet weak var checkContainsNumberImage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var isShowPass: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func showEmailError(_ error: String) {
        print(error)
        emailContainerView.addBorderView(width: 0.5, color: AppColors.secondryColor)
        if error == "Email is required" {
            emailContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        } else if error == "Approved Email" {
            emailContainerView.addBorderView(width: 0.5, color: AppColors.primaryColor)
        }
    }
    
    func showPasswordError(_ error: String) {
        passwordContainerView.addBorderView(width: 0.5, color: AppColors.secondryColor)
        if error == "validation_digit" {
            self.checkCharactersCountImage.image = UIImage(named: "approvedPassword")
            self.checkContainsNumberImage.image = UIImage(named: "unApprovedPassword")
            
        } else if error == "validation_min" {
            self.checkContainsNumberImage.image = UIImage(named: "approvedPassword")
            self.checkCharactersCountImage.image = UIImage(named: "unApprovedPassword")
        } else if error == "Password is required" {
            self.checkContainsNumberImage.image = UIImage(named: "unApprovedPassword")
            self.checkCharactersCountImage.image = UIImage(named: "unApprovedPassword")
            passwordContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        } else if error == "validation_digit,validation_min"{
            self.checkContainsNumberImage.image = UIImage(named: "unApprovedPassword")
            self.checkCharactersCountImage.image = UIImage(named: "unApprovedPassword")
        } else {
            self.checkContainsNumberImage.image = UIImage(named: "approvedPassword")
            self.checkCharactersCountImage.image = UIImage(named: "approvedPassword")
            passwordContainerView.addBorderView(width: 0.5, color: AppColors.primaryColor)
        }
    }
    
    
    @IBAction func showablePassword(_ sender: UIButton) {
        if isShowPass != false  {
            passwordTextField.isSecureTextEntry = true
            self.isShowPass = false
        } else {
            passwordTextField.isSecureTextEntry = false
            self.isShowPass = true
        }
    }
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let pass = passwordTextField.text
        
        try? handler?.performSignUp(email, pass)
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        switch sender {
        case emailTextField:
            try? handler?.validateEmailAddress(text)
        case passwordTextField:
            try? handler?.validatePassword(text)
        default: break
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    private func setupUI() {
        self.passwordTextField.delegate = self
        
        emailContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        emailContainerView.addCornerRadius(radius: 25)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: AppColors.secondryTextColor])
        
        passwordContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        passwordContainerView.addCornerRadius(radius: 25)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: AppColors.secondryTextColor])
        
        signUpButton.addBorderView(width: 0, color: AppColors.formTextColor)
        signUpButton.addCornerRadius(radius: 25)
    }
    
}
