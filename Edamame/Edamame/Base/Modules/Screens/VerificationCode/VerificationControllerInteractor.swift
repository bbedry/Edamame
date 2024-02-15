//
//  VerificationControllerInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 28.01.2024.
//

import Foundation

protocol VerificationControllerInteractorProtocol {
    func sendVerificationCode(_ sendingEmail: String?)
}

fileprivate var verificationService: NetworkServiceProtocol = NetworkService()
fileprivate var sendGridManager = SendGridManager()

final class VerificationControllerInteractor {
    var otpCode: String? {
        return generateOTP()
    }
    
}

extension VerificationControllerInteractor: VerificationControllerInteractorProtocol {
    func sendVerificationCode(_ sendingEmail: String?) {
                
        sendGridManager.sendVerification(sendingEmail ?? "", self.otpCode ?? "")
        sendGridManager.didSuccess = {
            
            }
        }
    }

extension VerificationControllerInteractor {
    func generateOTP() -> String {
        let digit = "0123456789"
        let otpLength = 4
        var otp = ""
        
        for _ in 0..<otpLength {
            let randomIndex = Int(arc4random_uniform(UInt32(digit.count)))
            let digits = digit[digit.index(digit.startIndex, offsetBy: randomIndex)]
            otp.append(digits)
        }
        
        return otp
    }
}

    
    
