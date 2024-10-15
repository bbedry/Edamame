//
//  ScanViewControllerPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import Foundation
import UIKit

protocol ScanControllerPresenterProtocol: ScanControllerHandler {
    var view: ScanControllerProtocol? { get set }
    var interactor: ScanViewControllerInteractor? { get set }
    var router: ScanRouter? { get set }
}

class ScanViewControllerPresenter: ScanControllerPresenterProtocol {

    var view: ScanControllerProtocol?
    
    var interactor: ScanViewControllerInteractor?
    
    var router: ScanRouter?
    
    init(view: ScanControllerProtocol?, router: ScanRouter?, interactor: ScanViewControllerInteractor?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
}