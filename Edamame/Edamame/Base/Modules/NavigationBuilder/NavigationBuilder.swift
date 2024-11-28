//
//  NavigationBuilder.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//


import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
   static func build(rootView: UIViewController) -> UINavigationController {
       let navigationController = UINavigationController(rootViewController: rootView)
       
       let titleStyle: [NSAttributedString.Key: Any] = [.foregroundColor: AppColors.primaryLight, .font: AppFont.interBold24!]
       
       
       let appearance = UINavigationBarAppearance()
       appearance.shadowColor = .clear
       appearance.backgroundColor = AppColors.light
       appearance.titleTextAttributes = titleStyle
       
       
       UINavigationBar.appearance().isTranslucent = false
       UINavigationBar.appearance().tintColor = .white
       UINavigationBar.appearance().standardAppearance = appearance
       UINavigationBar.appearance().compactAppearance = appearance
       UINavigationBar.appearance().scrollEdgeAppearance = appearance
       
       return navigationController
    }
}
