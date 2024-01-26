//
//  SignUpPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 25.01.2024.
//

import Foundation

protocol SignUpPresenterProtocol: SignUpControllerProtocolHandler {
    var view: SignUpControllerProtocol? { get set }
    var router: SignUpRouter? { get set }
    var interactor: SignUpInteractorProtocol? { get set }
    
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    weak var view: SignUpControllerProtocol?
    var router: SignUpRouter?
    var interactor: SignUpInteractorProtocol?
    
    
    // MARK: - Functions
    func showValidateError(_ error: Error) {
        if let error = error as? EmailError {
            view?.showEmailError(error.localizedDescription)
        } else if let error = error as? PasswordError {
            view?.showPasswordError(error.localizedDescription)
        } else {
//            router?.showError(error)
        }
    }
    

}
extension SignUpPresenter {
    func validateEmailAddress(_ email: String?) throws {
        do {
            try interactor?.validateEmail(email)
        } catch (let error) {
            showValidateError(error)
            return
        }
        
    }
    
    func validatePassword(_ pass: String) throws {
        do {
          try interactor?.validatePassword(pass)
        } catch (let error) {
//            view?.isValidatePassword(error)
            showValidateError(error)
            return
        }
    }
}
