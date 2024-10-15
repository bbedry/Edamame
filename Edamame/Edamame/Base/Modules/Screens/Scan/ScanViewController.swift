//
//  ScanViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit


protocol ScanControllerHandler {}
protocol ScanControllerProtocol: AnyObject {
    var handler: ScanControllerHandler? { get set }
}

class ScanViewController: UIViewController, ScanControllerProtocol {
    var handler: ScanControllerHandler?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    
}
