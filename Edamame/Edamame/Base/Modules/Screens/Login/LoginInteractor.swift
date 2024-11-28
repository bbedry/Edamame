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
protocol SıgnInLoginInteractorOutputProtocol: AnyObject {
    func signInSuccess(user: UserDataResponse)
    func signInError(error: Error)
}


fileprivate var firebaseManager = FirebaseManager()

final class LoginInteractor {
    weak var signUpOutPut: SignUpInteractorOutputProtocol?
    weak var signInOutput: SıgnInLoginInteractorOutputProtocol?
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
                guard let userData = user else { return }
                self.signInOutput?.signInSuccess(user: UserDataResponse(uid: userData.user.uid, email: userData.user.email))
            case .failure(let error):
                self.signInOutput?.signInError(error: error)
//                self.outPut?.signUpResultError(result: error)
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
