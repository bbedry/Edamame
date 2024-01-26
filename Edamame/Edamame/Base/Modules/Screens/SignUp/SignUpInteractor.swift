//
//  SignUpInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation

protocol SignUpInteractorProtocol {
    func validateEmail(_ email: String?) throws
    func validatePassword(_ password: String?) throws
}

final class SignUpInteractor: SignUpInteractorProtocol {
    func validateEmail(_ email: String?) throws {
        guard let email = email, !email.trimmed.isEmpty else {
            throw EmailError.empty
        }
        
        if !email.validateRegex(.email) {
            throw EmailError.invalid(reason: .format)
        }
        
        if !email.hasSuffix("@gmail.com") {
            throw EmailError.invalid(reason: .suffix)
        }
    }
    
    func validatePassword(_ password: String?) throws {
        guard let password = password, !password.trimmed.isEmpty else {
            throw PasswordError.empty
        }
        
        if password.count < 6 || password.count > 20 {
            throw PasswordError.invalid(reason: .length)
        }
        
        if !password.validateRegex(.password) {
            throw PasswordError.invalid(reason: .format)
        }
    }
    
    
    
}
