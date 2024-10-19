//
//  ScanViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit


protocol ScanControllerHandler {
    func showCamera(on view: UIView)
}
protocol ScanControllerProtocol: AnyObject {
    var handler: ScanControllerHandler? { get set }
}

class ScanViewController: BaseViewController, ScanControllerProtocol {
    var handler: ScanControllerHandler?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        handler?.showCamera(on: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         tabBarController?.tabBar.isHidden = true // TabBar'ı gizle
     }

     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         tabBarController?.tabBar.isHidden = false // TabBar'ı geri göster
     }
}
