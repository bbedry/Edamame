//
//  OnBoardingPresenter.swift
//  Edamame
//
//  Created by Bedri Doğan on 23.01.2024.
//

import Foundation

protocol OnBoardingPresenterProtocol: OnBoardingProtocolHandler {
    var view: OnBoardingProtocol? { get set }
    var router: OnBoardingRouter? { get set }
}

final class OnBoardingPresenter : OnBoardingPresenterProtocol {
    var view: OnBoardingProtocol?
    var router: OnBoardingRouter?
    
    func presentLoginPage() {
        router?.changeRootViewController()
    }
}
