//
//  LoginRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import UIKit


class LoginRouter: Router {
    
   var rootVC: UIViewController?
    
    func showScreen(type: ScreenType) {
        switch type {
        case .homeModule:
            presentHomeViewController()
        case .signUpController:
            presentSignUpViewController()
        }
    }
    
    func presentHomeViewController() {
        AppDelegate.shared.router?.configRootVC(screenType: .homeModule)
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
    
    func presentSignUpViewController() {
        AppDelegate.shared.router?.configRootVC(screenType: .signUpModule)
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
    
}

extension LoginRouter {
    enum ScreenType {
        case homeModule
        case signUpController
    }
}
