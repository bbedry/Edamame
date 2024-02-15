//
//  Router.swift
//  Edamame
//
//  Created by Bedri Doğan on 22.01.2024.
//

import UIKit

protocol Router {
    associatedtype View: UIViewController
    
    var rootVC: View? { get set }
    
    func showError(_ error: String)
}

extension Router {
    func showError(_ error: String) {
        let alert = UIAlertController(title: "ERROR", message: error, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        rootVC?.present(alert, animated: true, completion: nil)
    }
}

