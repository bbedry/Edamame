//
//  VerificationViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 28.01.2024.
//

import UIKit

protocol VerificationControllerHandler {
    func viewDidLoad(_ sendingEmail: String?)
    func sendVerificationCode(_ sendingEmail: String?)
}

protocol VerificationControllerProtocol: AnyObject {
    var handler: VerificationControllerHandler? { get set }
}

class VerificationViewController: UIViewController, VerificationControllerProtocol {
    
    var handler: VerificationControllerHandler?
    
    @IBOutlet weak var firstDigitTextField: UITextField!
    @IBOutlet weak var secondDigitTextField: UITextField!
    @IBOutlet weak var thirdDigitTextField: UITextField!
    @IBOutlet weak var fourthDigitTextField: UITextField!
    
    @IBOutlet weak var firstDigitContainerView: UIView!
    @IBOutlet weak var secondDigitContainerView: UIView!
    @IBOutlet weak var thirdDigitContainerView: UIView!
    @IBOutlet weak var fourthDigitContainerView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var sendCodeAgainButton: UIButton!
    
    var sendingEmail: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        handler?.viewDidLoad(self.sendingEmail)
    }
    
    @IBAction func verifyButtonTapped(_ sender: UIButton) {
        
        
//        handler?.sendVerificationCode()
    }
    
    @IBAction func sendCodeAgainButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension VerificationViewController {
   private func setupUI() {
//        verifyButton.addBorderView(width: 0.5, color: AppColors.primaryColor)
       firstDigitContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
       secondDigitContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
       thirdDigitContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
       fourthDigitContainerView.addBorderView(width: 0.5, color: AppColors.outlineColor)
       
       verifyButton.backgroundColor = AppColors.primaryColor
        verifyButton.addCornerRadius(radius: 25)
        
        sendCodeAgainButton.addBorderView(width: 0.5, color: AppColors.outlineColor)
        sendCodeAgainButton.addCornerRadius(radius: 25)
    }
}
