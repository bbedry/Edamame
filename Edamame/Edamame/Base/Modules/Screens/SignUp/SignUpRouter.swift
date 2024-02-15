//
//  SignUpRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 25.01.2024.
//

import Foundation
import UIKit

protocol SendVerificationCodeRouter: AnyObject {
    func passUserDataToVerification(_ userData: UserDataResponse?)
}

final class SignUpRouter: Router, SendVerificationCodeRouter {
  
    var rootVC: UIViewController?
    weak var delegate: SendVerificationCodeRouter?
    
    func passUserDataToVerification(_ data: UserDataResponse?) {
        delegate?.passUserDataToVerification(data)
        presentVerificationController()
      
    }
    
    #warning("bu metoda gerek kalmayabilir o yüzden commente alıyorum.")
//    func showScreen(type: ScreenType) {
//        switch type {
//        case .sendVerificationController:
//            presentVerificationController()
//        }
//    }
    
    func presentVerificationController() {
        AppDelegate.shared.router?.configRootVC(screenType: .verificationModule )
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
    
}
extension SignUpRouter {
    enum ScreenType {
        case sendVerificationController
    }
}
