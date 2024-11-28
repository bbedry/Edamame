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
//    var signInOutput: SıgnInLoginInteractorOutputProtocol?
    
    var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouter?
    
    func showValidateError(_ error: Error) {
        if let error = error as? EmailError {
            view?.showEmailError(error.localizedDescription)
        } else if let error = error as? PasswordError {
            view?.showPasswordError(error.localizedDescription)
        } else if let error = error as? ValidationError {
            router?.showError(error.localizedDescription)
        }
    }
   
 
    
}

extension LoginPresenter {
    
    func performGoogleLogin(_ email: String?, _ pass: String?) throws {
        do {
//            try interactor?.performGoogleLogin(email, pass)
        } catch (let error) {
            showValidateError(error)
            return
        }
    }
    func performLogin(_ email: String?, pass: String?) throws {
        do {
            try interactor?.login(email: email, password: pass)
        } catch (let error) {
            showValidateError(error)
            return
        }
    }
    
    func validateEmail(_ email: String) throws {
        do {
            try interactor?.validateEmail(email)
        } catch (let error) {
            showValidateError(error)
            return
        }
    }
    
    func validatePassword(_ password: String) throws {
        do {
          try interactor?.validatePassword(password)
        } catch (let error) {
            showValidateError(error)
            return
        }

    }
    
    func presentSignUpController() {
        router?.showScreen(type: .signUpController)
    }
}

extension LoginPresenter: SıgnInLoginInteractorOutputProtocol {
    func signInSuccess(user: UserDataResponse) {
        router?.showScreen(type: .homeModule)
    }
    
    func signInError(error: Error) {
        print(error)
    }
    
    
}
