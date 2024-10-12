//
//  VerificationViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 28.01.2024.
//

import UIKit

protocol VerificationControllerHandler {
    func viewDidLoad(_ sendingEmail: String?)
    func isValidateOTPCode(_ otpCode: String?)
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
    
    var countdownTimer: Timer!
    var totalTime = 120
    var otpTextFields: [UITextField] = []
    let numberOfFields = 4
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTextField()
        startTimer()
        handler?.viewDidLoad(self.sendingEmail)
    }
    
    
    private func setTextField() {
        firstDigitTextField.delegate = self
        secondDigitTextField.delegate = self
        thirdDigitTextField.delegate = self
        fourthDigitTextField.delegate = self
        
        firstDigitTextField.textContentType = .oneTimeCode
        firstDigitTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        firstDigitTextField.becomeFirstResponder()
    }
    
    @IBAction func verifyButtonTapped(_ sender: UIButton) {
        if ((self.firstDigitTextField.text != nil && self.firstDigitTextField.text != "") &&
            (self.secondDigitTextField.text != nil && self.secondDigitTextField.text != "") &&
            (self.thirdDigitTextField.text != nil && self.thirdDigitTextField.text != "") &&
            (self.fourthDigitTextField.text != nil && self.fourthDigitTextField.text != "")) {
            
            let code = "\(self.firstDigitTextField.text ?? "")" + "\(self.secondDigitTextField.text ?? "")" + "\(self.thirdDigitTextField.text ?? "")" + "\(self.fourthDigitTextField.text ?? "")"
            
            handler?.isValidateOTPCode(code)
        } else {
            
        }
        
//
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
    
    func startTimer() {
            countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        @objc func updateTimer() {
            if totalTime > 0 {
                totalTime -= 1
                timeLabel.text = formatTime(totalTime)
            } else {
                resetTimer()
            }
        }
        
        func resetTimer() {
            totalTime = 180
            timeLabel.text = formatTime(totalTime)
        }
        
        func formatTime(_ seconds: Int) -> String {
            let minutes = seconds / 60
            let remainingSeconds = seconds % 60
            return String(format: "%02d:%02d", minutes, remainingSeconds)
        }
        
}

extension VerificationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstDigitTextField {
            firstDigitContainerView.layer.borderColor = AppColors.blue01Dark.cgColor
        } else if textField == secondDigitTextField {
            secondDigitContainerView.layer.borderColor = UIColor.blue.cgColor
        } else if textField == thirdDigitTextField {
            thirdDigitContainerView.layer.borderColor = UIColor.blue.cgColor
        } else if textField == fourthDigitTextField {
            fourthDigitContainerView.layer.borderColor = UIColor.blue.cgColor
        } else {
            textField.layer.borderColor = AppColors.overlayLight.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == firstDigitTextField {
            firstDigitContainerView.layer.borderColor = AppColors.overlayLight.cgColor
        } else if textField == secondDigitTextField {
            secondDigitContainerView.layer.borderColor = AppColors.overlayLight.cgColor
        } else if textField == thirdDigitTextField {
            thirdDigitContainerView.layer.borderColor = AppColors.overlayLight.cgColor
        } else if textField == fourthDigitTextField {
            fourthDigitContainerView.layer.borderColor = AppColors.overlayLight.cgColor
        } else {
            textField.layer.borderColor = AppColors.blue01Dark.cgColor
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if #available(iOS 12.0, *) {
            self.firstDigitTextField.becomeFirstResponder()
            if textField.textContentType == UITextContentType.oneTimeCode{
                if let otpCode = textField.text, otpCode.count > 3 {
                    firstDigitTextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 0)])
                    secondDigitTextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 1)])
                    thirdDigitTextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 2)])
                    fourthDigitTextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 3)])
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.count == 1){
            if textField == firstDigitTextField {
                secondDigitTextField?.becomeFirstResponder()
            }
            if textField == secondDigitTextField {
                thirdDigitTextField?.becomeFirstResponder()
            }
            if textField == thirdDigitTextField {
                fourthDigitTextField?.becomeFirstResponder()
            }
            if textField == fourthDigitTextField {
                fourthDigitTextField?.resignFirstResponder()
                textField.text? = string
                //APICall Verify OTP
            }
            textField.text? = string
            return false
        } else {
            if textField == firstDigitTextField {
                firstDigitTextField?.becomeFirstResponder()
            }
            if textField == secondDigitTextField {
                firstDigitTextField?.becomeFirstResponder()
            }
            if textField == thirdDigitTextField {
                secondDigitTextField?.becomeFirstResponder()
            }
            if textField == fourthDigitTextField {
                thirdDigitTextField?.becomeFirstResponder()
            }
            textField.text? = string
            return false
        }
    }
}
