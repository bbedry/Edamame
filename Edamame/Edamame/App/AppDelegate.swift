//
//  AppDelegate.swift
//  Edamame
//
//  Created by Bedri Doğan on 21.01.2024.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth


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
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance.delegate = self
        FirebaseApp.configure()
        
        
        openOnBoardingPage()
        
        
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handled = GIDSignIn.sharedInstance.handle(url)
        return handled
    }
    
    func openOnBoardingPage() {
        let rootRouter = RootRouter(screenType: .onBoarding)
        router = rootRouter
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootRouter.rootVC
        window?.makeKeyAndVisible()
    }

}

