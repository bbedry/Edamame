//
//  CameraViewPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 21.10.2024.
//

import Foundation


protocol CameraViewPresenterProtocol: CameraViewControllerHandler {
    var view: CameraViewControllerProtocol? { get set }
    var interactor: CameraViewInteractor? { get set }
    var router: CameraViewRouter? { get set }
}

class CameraViewPresenter: CameraViewPresenterProtocol {
    
    
    var view: CameraViewControllerProtocol?
    
    var interactor: CameraViewInteractor?
    
    var router: CameraViewRouter?
    
    init(view: CameraViewControllerProtocol?, router: CameraViewRouter?, interactor: CameraViewInteractor?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}
