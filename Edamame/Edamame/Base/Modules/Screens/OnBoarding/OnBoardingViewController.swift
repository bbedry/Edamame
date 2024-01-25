//
//  OnBoardingViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 23.01.2024.
//

import UIKit



protocol OnBoardingProtocolHandler {
    func presentLoginPage()
}

protocol OnBoardingProtocol: AnyObject {
    var handler: OnBoardingProtocolHandler? { get set }
}

final class OnBoardingViewController: UIViewController, OnBoardingProtocol {

    @IBOutlet weak var presentLoginButton: UIButton!
    
    var handler: OnBoardingProtocolHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let handler = handler else {
            print("handler not set")
            return
        }
    }
    
    @IBAction func presentLoginButton(_ sender: UIButton) {
        handler?.presentLoginPage()
    }
}
