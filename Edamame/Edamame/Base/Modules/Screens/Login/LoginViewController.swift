//
//  LoginViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import UIKit

protocol LoginViewHandler {
    func performLogin(_ email: String?, pass: String?)
    func validateEmail(_ email: String) throws
    func validatePassword(_ password: String) throws
}

protocol LoginViewProtocol: AnyObject {
    var handler: LoginViewHandler? { get set }
    
    func showEmailError(_ error: String)
    func showPasswordError(_ error: String)
}

class LoginViewController: UIViewController, LoginViewProtocol {

    
    
    var handler: LoginViewHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func showEmailError(_ error: String) {
        <#code#>
    }
    
    func showPasswordError(_ error: String) {
        <#code#>
    }
}
