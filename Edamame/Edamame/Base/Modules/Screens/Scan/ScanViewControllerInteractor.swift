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
    func startCameraSession(on view: UIView)
}

class ScanViewControllerInteractor: ScanControllerInteractorProtocol {
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    func startCameraSession(on view: UIView) {
    captureSession = AVCaptureSession()
        
       guard let captureSession = captureSession else { return }


       guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
       let videoInput: AVCaptureDeviceInput

       do {
           videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
       } catch {
           return
       }

       if (captureSession.canAddInput(videoInput)) {
           captureSession.addInput(videoInput)
       } else {
           return
       }

    
       previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
       previewLayer?.frame = view.layer.bounds
       previewLayer?.videoGravity = .resizeAspectFill
       view.layer.addSublayer(previewLayer!)
        DispatchQueue.main.async {
            captureSession.startRunning()
        }
     
    }
}
