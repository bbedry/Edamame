//
//  OnBoardingRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 23.01.2024.
//

import UIKit


final class OnBoardingRouter: Router {
    
    var rootVC: UIViewController?
    
    func showScreen(type: ScreenType) {
        switch type {
        case .loginModule:
            changeRootViewController()
        }
    }
    
    func changeRootViewController() {
        AppDelegate.shared.router?.configRootVC(screenType: .loginModule)
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
}

extension OnBoardingRouter {
    enum ScreenType {
        case loginModule
    }
}
