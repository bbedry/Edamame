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
    func performLogin(_ email: String?, pass: String?)
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
    
    @IBAction func emailTextField(_ sender: UITextField) {
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func loginWithGoogleTapped(_ sender: UIButton) {
        
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
    
    func showEmailError(_ error: String) {
        print(error)
    }
    
    func showPasswordError(_ error: String) {
        print(error)
    }
    
    
    
}

//MARK: Setup loginViewController Components UI
extension LoginViewController {
    func setupUI() {
        emailContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        emailContainerView.addCornerRadius(radius: 25)
        
        passwordContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
        passwordContainerView.addCornerRadius(radius: 25)
        
        loginButton.addCornerRadius(radius: 25)
        googleLoginButton.addCornerRadius(radius: 25)
        
    }
}
