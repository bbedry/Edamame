//
//  HomeViewControllerPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import Foundation


protocol HomePresenterProtocol: HomeViewHandler {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeViewControllerInteractor? { get set }
    var router: HomeViewControllerRouter? { get set }
}

class HomeViewControllerPresenter:  HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeViewControllerInteractor?
    var router: HomeViewControllerRouter?
    
    
}
