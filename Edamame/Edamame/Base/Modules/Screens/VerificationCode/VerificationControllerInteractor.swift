//
//  VerificationControllerInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 28.01.2024.
//

import Foundation

protocol VerificationControllerInteractorProtocol {
    func sendVerificationCode()
}

fileprivate var firebasemanager = FirebaseManager()

final class VerificationControllerInteractor {
    
}

extension VerificationControllerInteractor: VerificationControllerInteractorProtocol {
    func sendVerificationCode() {
        firebasemanager.sendEmailVerification { [weak self] result in
            print(result)
        }
    }
    
    
}
