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
    private let shadowViewHeight: CGFloat = 0.5
    private var shadowView: UIView?
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            setupTabBarShadow()
    }
}

extension BaseTabBarController: TabBarViewInterface {
    func setupView() {
        tabBar.isTranslucent = true
        tabBar.backgroundColor = UIColor.clear
        tabBar.tintColor = .black
    }
    
    private func setupTabBarShadow() {
          if shadowView == nil {
              let shadowView = UIView(frame: CGRect(
                  x: 0,
                  y: (tabBar.frame.origin.y - (shadowViewHeight) - 10 ),
                  width: tabBar.frame.width,
                  height: shadowViewHeight
              ))
              shadowView.backgroundColor = .lightGray
              shadowView.layer.shadowColor = UIColor.black.cgColor
              shadowView.layer.shadowOpacity = 0.7
              shadowView.layer.shadowOffset = CGSize(width: 0, height: -4)
              shadowView.layer.shadowRadius = 4
              shadowView.layer.masksToBounds = false
              
              view.addSubview(shadowView)
              self.shadowView = shadowView
          }
      }
}
