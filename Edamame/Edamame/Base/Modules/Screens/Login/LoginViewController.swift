//
//  LoginViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import UIKit



protocol LoginViewProtocol: AnyObject {
    var handler: LoginViewHandler? { get set }
    
    func showEmailError(_ error: String)
    func showPasswordError(_ error: String)
}

protocol LoginViewHandler {
    func performGoogleLogin(_ email: String?,_ pass: String?) throws
    func performLogin(_ email: String?, pass: String?) throws
    func validateEmail(_ email: String) throws
    func validatePassword(_ password: String) throws
    
    
    func presentSignUpController()
}

class LoginViewController: UIViewController, LoginViewProtocol {

    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    
    var handler: LoginViewHandler?
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
        if error == "Approved Password" {
            passwordContainerView.addBorderView(width: 0.5, color: AppColors.primaryColor)
        }
        passwordContainerView.addBorderView(width: 0.5, color: AppColors.secondryColor)
       
    }
    
    @IBAction func textFieldValueEnded(_ sender: UITextField) {
        guard let text = sender.text else { return }
     
             switch sender {
             case emailTextField:
                 try? handler?.validateEmail(text)
             case passwordTextField:
                 try? handler?.validatePassword(text)
             default: break
             }
    }
        
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let pass = passwordTextField.text
        
        try? handler?.performLogin(email, pass: pass)
    }
    
    @IBAction func loginWithGoogleTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let pass = passwordTextField.text
        
        try? handler?.performGoogleLogin(email, pass)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        handler?.presentSignUpController()
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
    
    
    
    
}

//MARK: Setup loginViewController Components UI
extension LoginViewController: UITextFieldDelegate {
    private func setupUI() {
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
        emailContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        emailContainerView.addCornerRadius(radius: 25)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: AppColors.secondryTextColor])
        
        passwordContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        passwordContainerView.addCornerRadius(radius: 25)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: AppColors.secondryTextColor])
        
        loginButton.addBorderView(width: 0, color: AppColors.formTextColor)
        loginButton.addCornerRadius(radius: 25)
        
        googleLoginButton.addBorderView(width: 0, color: AppColors.primaryColor)
        googleLoginButton.addCornerRadius(radius: 25)
    }
}

