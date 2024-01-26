//
//  LoginPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import Foundation

protocol LoginPresenterProtocol: LoginViewHandler {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouter? { get set }
}


class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouter?
   
    
    func performLogin(_ email: String?, pass: String?) {
        print(email)
    }
    
    func validateEmail(_ email: String) throws {
        print(email)
    }
    
    func validatePassword(_ password: String) throws {
        print(password)
    }
    
    func presentSignUpController() {
        router?.showScreen(type: .signUpController)
    }
    
}
