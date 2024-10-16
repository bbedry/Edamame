//
//  ScanBuilder.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

class ScanBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let router = ScanRouter()
        let storyboard = UIStoryboard.init(name: "ScanViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ScanViewController") as! ScanViewController
        let interactor = ScanViewControllerInteractor()
        let presenter = ScanViewControllerPresenter(view: view, router: router, interactor: interactor)
        view.title = "Scan Food"
        view.handler = presenter
        
        return factory(view)
    }
}
