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
}

protocol SignUpControllerProtocol: AnyObject {
    var handler: SignUpControllerProtocolHandler? { get set }
    
    func showEmailError(_ error: String)
    func showPasswordError(_ error: String)
}


final class SignUpViewController: UIViewController, SignUpControllerProtocol, UITextFieldDelegate {
    
    
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
        
    }
    
    func showPasswordError(_ error: String) {
        
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        switch sender {
        case emailTextField:
            try? handler?.validateEmailAddress(text)
        case passwordTextField:
            try? handler?.validatePassword(text)
        default: break
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
        
    }
    
}

extension SignUpViewController {
    private func setupUI() {
        
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
