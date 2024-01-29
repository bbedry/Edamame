//
//  SignUpRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 25.01.2024.
//

import Foundation
import UIKit


final class SignUpRouter: Router {
    var rootVC: UIViewController?
    
    func showScreen(type: ScreenType, _ currentUser: UserDataResponse?) {
        switch type {
        case .sendVerificationController:
            presentVerificationController(currentUser)
        }
    }
    
    func presentVerificationController(_ currentUser: UserDataResponse?) {
        AppDelegate.shared.router?.configRootVC(currentUser, screenType: .verificationModule )
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
    
}
extension SignUpRouter {
    enum ScreenType {
        case sendVerificationController
    }
}
