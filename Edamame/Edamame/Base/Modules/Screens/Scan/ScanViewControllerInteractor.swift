//
//  ScanViewControllerInteractor.swift
//  Edamame
//
//  Created by Bedri Doğan on 13.10.2024.
//

import Foundation
import UIKit
import AVFoundation

protocol ScanControllerInteractorProtocol {
    
}

class ScanViewControllerInteractor: ScanControllerInteractorProtocol {
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    func startCameraSession(on view: CameraViewController?) {
        guard let cameraView = view else {
                    print("Error: view is not a CameraView")
                    return
        }

      cameraView.setupCamera()
        }
     
    }
