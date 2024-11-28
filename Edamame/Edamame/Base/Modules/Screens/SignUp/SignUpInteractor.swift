//
//  SignUpInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation
import FirebaseAuth

protocol SignUpInteractorProtocol {
    func validateEmail(_ email: String?) throws
    func validatePassword(_ password: String?) throws
    func performSignUp(_ email: String?, pass: String?) throws
}

protocol SignUpInteractorOutputProtocol: AnyObject {
    func signUpResultSuccess(result: UserDataResponse)
    func signUpResultError(result: Error)
}

fileprivate var firebaseManager = FirebaseManager()

final class SignUpInteractor  {
    weak var outPut: SignUpInteractorOutputProtocol?
}

extension SignUpInteractor: SignUpInteractorProtocol {
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
    
    func performSignUp(_ email: String?, pass: String?) throws {
        guard let email = email, !email.isEmpty,
              let pass = pass, !pass.isEmpty else {
            throw ValidationError.empty(reason: .fillInformation)
        }
        
        firebaseManager.signUp(email: email, password: pass) { [weak self] result in
            print(result)
            switch result {
            case .success(let user):
                let userModel = UserDataResponse(uid: user?.uid, email: user?.email)
                self?.outPut?.signUpResultSuccess(result: userModel)
            case .failure(let error):
                self?.outPut?.signUpResultError(result: error)
            }
        }
        
      
    }
}
