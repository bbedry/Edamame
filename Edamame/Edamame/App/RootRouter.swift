//
//  RootRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import Foundation
import UIKit

final class RootRouter: Router {
    var rootVC: UIViewController?
    
    init(screenType: ScreenType) {
        configRootVC(screenType: screenType)
    }
    
    func configRootVC(screenType: ScreenType) {
        switch screenType {
        case .onBoarding:
            rootVC = onBoarding
        case .loginModule:
            rootVC = loginModule
        case .homeModule:
//            rootVC = homeModule
            
            print("home module")
        case .signUpModule:
            rootVC = signUpModule
        }
    }
    
    var onBoarding: OnBoardingViewController {
        let presenter = OnBoardingPresenter()
        
        let storyboard = UIStoryboard(name: "OnBoardingViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! OnBoardingViewController
        
        let vc = rootController
        vc.handler = presenter
        
        let router = OnBoardingRouter()
        router.rootVC = vc
        
        presenter.view = vc
        presenter.router = router
        
        return vc
    }
    
    var loginModule: LoginViewController {
        let presenter = LoginPresenter()
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! LoginViewController
        
        let vc = rootController
        vc.handler = presenter
        
        let router = LoginRouter()
        router.rootVC = vc
        
        presenter.view = vc
        presenter.router = router
        
        return vc
    }
    
    var signUpModule: SignUpViewController {
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        let interactor = SignUpInteractor()
        
        let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! SignUpViewController
        
        let vc = rootController
        vc.handler = presenter
       
        router.rootVC = vc
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        return vc
    }
    
    
//
//    var homeModule: UITabBarController {
//
//    }
    
}


extension RootRouter {
    enum ScreenType {
        case onBoarding
        case loginModule
        case signUpModule
        case homeModule
    }
}
