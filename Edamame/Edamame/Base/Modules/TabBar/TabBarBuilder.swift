//
//  TabBarBuilder.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//


import UIKit


class TabBarBuilder {
    
    static func build(submodules: TabBarRouter.subModules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(with: submodules)
        let tabBarController = BaseTabBarController(tabs: tabs)
        
        return tabBarController
    }
    
}
