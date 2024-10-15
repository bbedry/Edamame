//
//  ProfileBuilder.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

class ProfileBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let router = ProfileViewControllerRouter()
        let storyboard = UIStoryboard.init(name: "ProfileViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let interactor = ProfileViewControllerInteractor()
        let presenter = ProfileViewControllerPresenter(interactor: interactor, router: router, view: view)
        
        view.handler = presenter
        
        return factory(view)
    }
}
