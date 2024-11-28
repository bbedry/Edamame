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
    var userData: UserDataResponse?
    
    init(screenType: ScreenType ) {
        configRootVC(screenType: screenType)
    }
    
    func configRootVC(screenType: ScreenType ) {
        switch screenType {
        case .onBoarding:
            rootVC = onBoarding
        case .loginModule:
            rootVC = loginModule
        case .homeModule:
            rootVC = homeModule
            
            print("home module")
        case .signUpModule:
            rootVC = signUpModule
        case .verificationModule:
            rootVC = verificationModule
            
            
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
        let router = LoginRouter()
        let interactor = LoginInteractor()
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! LoginViewController
        
        let vc = rootController
        vc.handler = presenter
        
        interactor.signInOutput = presenter
//        interactor.signUpOutPut = presenter
        router.rootVC = vc
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        
        return vc
    }
    
    var signUpModule: SignUpViewController {
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        let interactor = SignUpInteractor()
        
        let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! SignUpViewController
        
        let vc = rootController
        router.delegate = self
        
        vc.handler = presenter
        interactor.outPut = presenter
        
        router.rootVC = vc
       
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        return vc
    }
    
  
    
    var verificationModule: VerificationViewController {
        let presenter = VerificationControllerPresenter()
        let router = VerificationControllerRouter()
        let interactor = VerificationControllerInteractor()
        
        let storyboard = UIStoryboard(name: "VerificationViewController", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! VerificationViewController
        
        let vc = rootController
        
        
        vc.handler = presenter
        presenter.interactor = interactor
        presenter.router = router
        vc.sendingEmail = userData?.email
        
        return vc
    }
    
    var homeModule: UITabBarController {
        let submodules = (
            home: HomeBuilder.build(usingNavigationFactory: NavigationBuilder.build),
            scan: ScanBuilder.build(usingNavigationFactory: NavigationBuilder.build),
            profile : ProfileBuilder.build(usingNavigationFactory: NavigationBuilder.build)
            
        
        )
        
        let tabBarController = TabBarBuilder.build(submodules: submodules)
        
        return tabBarController
    }
//    var homeModule: HomeViewController {
//        let presenter = HomeViewControllerPresenter()
//        let router = HomeViewControllerRouter()
//        let interactor = HomeViewControllerInteractor()
//        
//        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
//        let rootController = storyboard.instantiateInitialViewController() as! HomeViewController
//        
//        let vc = rootController
//        vc.handler = presenter
//        presenter.interactor = interactor
//        presenter.router = router
//        
//        
//        return vc
//        
//    }

}
extension RootRouter: SendVerificationCodeRouter{
    func passUserDataToVerification(_ userData: UserDataResponse?) {
        
        self.userData = userData
        
    }
}


extension RootRouter {
    enum ScreenType {
        case onBoarding
        case loginModule
        case signUpModule
        case verificationModule
        case homeModule
    }
}
