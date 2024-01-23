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
        case .loginModule:
            rootVC = loginModule
        case .homeModule:
            rootVC = homeModule
        }
    }
    
    var loginModule: LoginViewController {
        
    }
    
    var homeModule: UITabBarController {
        
    }
    
}


extension RootRouter {
    enum ScreenType {
        case loginModule
        case homeModule
    }
}
