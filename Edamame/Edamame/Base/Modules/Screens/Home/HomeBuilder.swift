//
//  HomeBuilder.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

class HomeBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let router = HomeViewControllerRouter()
        let storyboard = UIStoryboard.init(name: "HomeViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeViewControllerInteractor()
        let presenter = HomeViewControllerPresenter(view: view, router: router, interactor: interactor)
        
        view.handler = presenter
        
        return factory(view)
    }
}
