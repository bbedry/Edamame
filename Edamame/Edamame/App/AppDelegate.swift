//
//  AppDelegate.swift
//  Edamame
//
//  Created by Bedri Doğan on 21.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private(set) var router: RootRouter?
    
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast 'UIApplication shared delegate' to 'Appdelegate'")
        }
        return shared
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        openOnBoardingPage()
        
        return true
    }
    
    func openOnBoardingPage() {
        let rootRouter = RootRouter(screenType: .onBoarding)
        router = rootRouter
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootRouter.rootVC
        window?.makeKeyAndVisible()
    }

}

