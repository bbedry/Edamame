//
//  TabBarRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

class TabBarRouter {
    var viewController : UIViewController
    
    typealias subModules = (
        home: UIViewController,
        scan: UIViewController,
        profile: UIViewController
        
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TabBarRouter {
    
    static func tabs(with submodules: subModules) -> HomeTabs {
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        let scanTabBarItem = UITabBarItem(title: "", image: UIImage(named: "scanIcon"), tag: 2)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
//        let savedProductTabBarItem = UITabBarItem(title: "Tags", image: UIImage(named: "savedProduct"), tag: 4)
//        let accountSettingsTabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "accountSettings"), tag: 5)
//        
        submodules.home.tabBarItem = homeTabBarItem
        submodules.scan.tabBarItem = scanTabBarItem
        submodules.profile.tabBarItem = profileTabBarItem
//        submodules.tags.tabBarItem = savedProductTabBarItem
//        submodules.settings.tabBarItem = accountSettingsTabBarItem
        
        return (
            home: submodules.home,
            scan: submodules.scan,
            profile: submodules.profile
            
        )
    }
}
