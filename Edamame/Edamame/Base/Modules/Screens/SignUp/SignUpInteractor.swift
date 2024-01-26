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
        } else {
            throw EmailError.approved
        }
    }
    
    func validatePassword(_ password: String?) throws {
        guard let password = password, !password.trimmed.isEmpty else {
            throw PasswordError.empty
        }
        
        if !password.validateRegex(.password)  {
            
            let validateMessage = ConsValidation().getMissingValidation(str: password).joined(separator: ",")
            
            throw PasswordError.invalid(validateMessage)
            
        } else {
            throw PasswordError.approved
        }
        
    }
    
    
    
}
