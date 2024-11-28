//
//  ProfileViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

protocol ProfileControllerHandler {}
protocol ProfileControllerProtocol: AnyObject {
    var handler: ProfileControllerHandler? { get set }
}
class ProfileViewController: UIViewController, ProfileControllerProtocol {
    var handler: ProfileControllerHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
    }
    


}
