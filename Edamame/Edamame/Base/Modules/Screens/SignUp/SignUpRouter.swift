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
    
    func showScreen(type: ScreenType) {
        switch type {
        case .sendVerificationController:
            presentVerificationController()
        }
    }
    
    func presentVerificationController() {
        AppDelegate.shared.router?.configRootVC(screenType: .verificationModule)
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
    
}
extension SignUpRouter {
    enum ScreenType {
        case sendVerificationController
    }
}
