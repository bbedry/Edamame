//
//  HomeViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var handler: HomeViewHandler? { get set }
}
protocol HomeViewHandler {}

class HomeViewController: UIViewController, HomeViewProtocol {
    var handler: HomeViewHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}
