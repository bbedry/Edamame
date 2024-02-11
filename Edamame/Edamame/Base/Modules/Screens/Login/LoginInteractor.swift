//
//  LoginInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

protocol LoginInteractorProtocol {
    
    func validateEmail(_ email: String?) throws
    func validatePassword(_ password: String?) throws
    func login(email: String?, password: String?) throws
//    func loginWithGoogle(_ email: String?,_ password: String?) throws
}

fileprivate var firebaseManager = FirebaseManager()

class LoginInteractor {
    weak var outPut: SignUpInteractorOutputProtocol?
}

extension LoginInteractor: LoginInteractorProtocol {
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
    
    func login(email: String?, password: String?) throws {
        guard let email = email, !email.isEmpty,
              let pass = password, !pass.isEmpty else {
            throw ValidationError.empty(reason: .fillInformation)
        }
        
        firebaseManager.signIn(email: email, password: pass) { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
  
}

//extension LoginInteractor: GIDSignInDelegate {
//    func loginWithGoogle(_ email: String?, _ password: String?) throws {
//        guard let email = email, !email.isEmpty,
//              let pass = password, !pass.isEmpty else {
//            throw ValidationError.empty(reason: .fillInformation)
//        }
//        
//   
//    }
//}
