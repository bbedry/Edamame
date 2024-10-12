//
//  VerificationControllerPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 28.01.2024.
//

import Foundation

protocol VerificationControllerPresenterProtocol: VerificationControllerHandler {
    var view: VerificationControllerProtocol? { get set }
    var interactor: VerificationControllerInteractorProtocol? { get set }
    var router: VerificationControllerRouter? { get set }
}
final class VerificationControllerPresenter: VerificationControllerPresenterProtocol {
 
    weak var view: VerificationControllerProtocol?
    var interactor: VerificationControllerInteractorProtocol?
    var router: VerificationControllerRouter?
 
}

extension VerificationControllerPresenter {
  
    func viewDidLoad(_ sendingEmail: String?) {
        interactor?.sendVerificationCode(sendingEmail)
    }
    
    func isValidateOTPCode(_ otpCode: String?) {
        interactor?.isValidateOTPCode(otpCode)
    }
}
