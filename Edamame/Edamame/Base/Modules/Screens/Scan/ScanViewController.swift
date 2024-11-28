//
//  ScanViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import UIKit


protocol ScanControllerHandler {
    func showCamera(on view: UIViewController)
}
protocol ScanControllerProtocol: AnyObject {
    var handler: ScanControllerHandler? { get set }
}

class ScanViewController: BaseViewController, ScanControllerProtocol {
    var handler: ScanControllerHandler?
    
    
    @IBOutlet weak var scanOnboardingImage: UIImageView!
    @IBOutlet weak var scanDescriptionLabel: UILabel!
    @IBOutlet weak var scannedFoodTableView: UITableView!
    
    @IBOutlet weak var scanButton: UIButton!
    
//    private var scanView: CameraView = CameraView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
//         tabBarController?.tabBar.isHidden = true // TabBar'ı gizle
     }

     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
//         tabBarController?.tabBar.isHidden = false // TabBar'ı geri göster
     }
    
    @IBAction func scanButtonTapped(_ sender: UIButton) {
      DispatchQueue.main.async {
        self.handler?.showCamera(on: self)
      }
       
    }
    
    
}
extension ScanViewController {
    private func setupUI() {
        scanButton.addBorderView(width: 0, color: AppColors.formTextColor)
        scanButton.addCornerRadius(radius: 25)
    
        
    }
}
