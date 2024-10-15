//
//  BaseTabbarController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//


import UIKit

protocol TabBarViewInterface: AnyObject {
    func setupView()
}

typealias HomeTabs = (
    home: UIViewController,
    scan: UIViewController,
    profile: UIViewController
    
)



class BaseTabBarController: UITabBarController {
    
    init(tabs: HomeTabs) {
        super.init(nibName: nil, bundle: nil)
        
        viewControllers = [tabs.home, tabs.scan, tabs.profile]
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension BaseTabBarController: TabBarViewInterface {
    func setupView() {
        tabBar.isTranslucent = true
        tabBar.backgroundColor = UIColor.black
    }
    
    
}
