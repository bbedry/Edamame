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

fileprivate var verificationService: NetworkServiceProtocol = NetworkService()
fileprivate var firebasemanager = FirebaseManager()

final class VerificationControllerInteractor {
    var email: String?
}

extension VerificationControllerInteractor: VerificationControllerInteractorProtocol {
    func sendVerificationCode() {
        
        firebasemanager.sendVerification()
        
//        verificationService.sendVerificationCode(email: self.email ?? "bedridogn@gmail.com") { [weak self] result in
//            guard let self = self else {
//                return
//            }
//            
//            print(result)
//        }
        }
    }
    
    
