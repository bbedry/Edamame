//
//  LoginInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import Foundation


protocol LoginInteractorProtocol {
    
    func validateEmail(_ email: String?) throws
    func validatePassword(_ password: String?) throws
    func login(email: String?, password: String?)
}

class LoginInteractor {
 
}

extension LoginInteractor: LoginInteractorProtocol {
    func validateEmail(_ email: String?) throws {
        print(email)
    }
    
    func validatePassword(_ password: String?) throws {
        print(password)
    }
    
    func login(email: String?, password: String?) {
        print(email, password)
    }
}
