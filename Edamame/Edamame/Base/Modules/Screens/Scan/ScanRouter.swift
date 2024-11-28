//
//  ScanRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit

//protocol CameraRouterProtocol: AnyObject {
//    static func createModule() -> CameraViewController
//    func presentCameraView(from view: UIViewController)
//}

class ScanRouter: Router {
    
    // Root ViewController değişkeni
    var rootVC: UIViewController?

//     CameraViewController modülünü oluşturma
    static func createModule() -> CameraViewController {
        let view = CameraViewController()  // View oluşturuluyor
        
       
        let interactor = CameraViewInteractor()
        let router = CameraViewRouter()
        
        let presenter = CameraViewPresenter(view: view, router:router , interactor: interactor)

        view.handler = presenter
        presenter.interactor = interactor
        presenter.router = router
//        interactor.presenter = presenter
        
        return view
    }

    func presentCameraView(from view: UIViewController) {
      DispatchQueue.main.async {
        let cameraViewController = ScanRouter.createModule()
        cameraViewController.modalPresentationStyle = .fullScreen
        cameraViewController.modalTransitionStyle = .crossDissolve
       
        if let navigationController = view.navigationController {
          navigationController.pushViewController(cameraViewController, animated: true)
        } else {
          
          view.present(cameraViewController, animated: true, completion: nil)
       
        }
      }
    }
}
