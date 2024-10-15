//
//  ProfileViewControllerPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

protocol ProfileControllerPresenterProtocol: ProfileControllerHandler {
    var view: ProfileControllerProtocol? { get set}
    var interactor: ProfileViewControllerInteractor? { get set}
    var router: ProfileViewControllerRouter? { get set}
}
class ProfileViewControllerPresenter: ProfileControllerPresenterProtocol {
    var interactor: ProfileViewControllerInteractor?
    
    var router: ProfileViewControllerRouter?
    
    var view: ProfileControllerProtocol?
    
    init(interactor: ProfileViewControllerInteractor?, router: ProfileViewControllerRouter?, view: ProfileControllerProtocol? ) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
