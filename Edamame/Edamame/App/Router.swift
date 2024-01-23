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
    
}
