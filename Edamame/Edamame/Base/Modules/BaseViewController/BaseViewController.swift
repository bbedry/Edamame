//
//  BaseViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 16.10.2024.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }
    
    func setNavigationLeftButton() {
        let leftButton: UIButton = UIButton(type: .custom)
        
        leftButton.setImage(UIImage(named: "back_button"), for: .normal)
        leftButton.tintColor = UIColor.black
        leftButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        leftButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftButton.backgroundColor = .clear
        leftButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        let backBarButton: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    @objc func popViewController() {
        if (self.navigationController?.viewControllers.count == 1) {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
