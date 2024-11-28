//
//  CameraViewController.swift
//  Edamame
//
//  Created by Bedri Doğan on 21.10.2024.
//

import UIKit
import AVFoundation


protocol CameraViewControllerProtocol: AnyObject {
    var handler: CameraViewControllerHandler? { get set }
}
protocol CameraViewControllerHandler {}

class CameraViewController: UIViewController, CameraViewControllerProtocol {
    var handler: CameraViewControllerHandler?
    var captureSession: AVCaptureSession!
    var photoOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var captureButton: UIButton!
  
  lazy var navigationView: UIView = {
    let navigationView = UIView()
    navigationView.backgroundColor = UIColor.white
    navigationView.translatesAutoresizingMaskIntoConstraints = false
    return navigationView
  }()
  
  lazy var navigationBackButton: UIButton = {
    let navigationBackButton = UIButton()
    navigationBackButton.setImage(UIImage(named: "back_button"), for: .normal)
    navigationBackButton.translatesAutoresizingMaskIntoConstraints = false
    navigationView.addSubview(navigationBackButton)
    navigationBackButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    return navigationBackButton
  }()
  
  lazy var navigationTitle: UILabel = {
    let navigationTitle = UILabel()
    navigationTitle.text = "Scan Food"
    navigationTitle.textAlignment = .center
    navigationTitle.textColor = UIColor.black
    navigationTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
    navigationTitle.translatesAutoresizingMaskIntoConstraints = false
    navigationView.addSubview(navigationTitle)
    
    return navigationTitle
  }()
  
  
  
  lazy var qrVideoView: UIView = {
    let qrVideoView = UIView()
    qrVideoView.backgroundColor = .clear
    qrVideoView.translatesAutoresizingMaskIntoConstraints = false
//    qrVideoView.clipsToBounds = true
    
    return qrVideoView
  }()
    
  lazy var scanFoodButton: UIButton = {
  let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor.green
    button.layer.masksToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOpacity = 0.5
    button.layer.shadowRadius = 10
    button.layer.shadowOffset = CGSize(width: 0, height: 4)
    
    button.heightAnchor.constraint(equalToConstant: 70).isActive = true
    button.widthAnchor.constraint(equalToConstant: 70).isActive = true
    button.layer.cornerRadius = 35
    
    
    button.setImage(UIImage(named: "scan_food"), for: .normal)
   
      // Button’a hedef eylem ekleyin (opsiyonel)
    button.addTarget(self, action: #selector(captureButtonPressed), for: .touchUpInside)
//    button.addTarget(self, action: #selector(circularButtonTapped), for: .touchUpInside)
    return button
  }()
  
  lazy var qrVideoDescription: UILabel = {
    let qrVideDescription = UILabel()
    qrVideDescription.text = "Scan your food for macros"
    qrVideDescription.textAlignment = .center
    qrVideDescription.textColor = UIColor.white
    qrVideDescription.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
    qrVideDescription.numberOfLines = 0
    qrVideDescription.translatesAutoresizingMaskIntoConstraints = false
    navigationView.addSubview(qrVideDescription)
    return qrVideDescription
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      DispatchQueue.main.async {
        self.addSubViews()
        self.setupConstraints()
        self.setupCamera()
      }
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Preview layer her layout değişiminde güncellenmeli
        previewLayer?.frame = view.bounds
    }
  

  @objc func captureButtonPressed() {
    capturePhoto()
  }
  
  @objc func tappedBackButton() {
    self.dismiss(animated: true, completion: nil)
  }

  func setupCamera() {
    captureSession = AVCaptureSession()
    captureSession.sessionPreset = .photo
    
    guard let camera = AVCaptureDevice.default(for: .video) else {
      print("Kamera bulunamadı")
      return
    }
    
    do {
      let input = try AVCaptureDeviceInput(device: camera)
      if captureSession.canAddInput(input) {
        captureSession.addInput(input)
      }
      
      photoOutput = AVCapturePhotoOutput()
      if captureSession.canAddOutput(photoOutput) {
        captureSession.addOutput(photoOutput)
      }
      
      previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
      previewLayer.videoGravity = .resizeAspectFill
      
      qrVideoView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
//      previewLayer.frame = qrVideoView.layer.bounds
      qrVideoView.layer.addSublayer(previewLayer!)
      
      DispatchQueue.global(qos: .background).async {
        self.captureSession.startRunning()
      }
   
    } catch {
      print("Kamera kurulurken hata oluştu: \(error)")
    }
  }

    // Kamera oturumunu durdurma
    func stopSession() {
        captureSession?.stopRunning()
    }
  func capturePhoto() {
    let settings = AVCapturePhotoSettings()
    settings.flashMode = .auto
    photoOutput.capturePhoto(with: settings, delegate: self)
  }
  
 
  
}
extension CameraViewController {
  func addSubViews()  {
    self.view.addSubview(navigationView)
    self.view.addSubview(qrVideoView)
    self.view.addSubview(scanFoodButton)
    
//    let overlayView = RectangleOverlayView(frame: self.view.bounds)
//    self.view.addSubview(overlayView)

  }
  
  func setupConstraints()  {
    self.view.backgroundColor = .clear
    
    NSLayoutConstraint.activate([
      navigationView.topAnchor.constraint(equalTo: view.topAnchor),
      navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
     
      navigationView.heightAnchor.constraint(equalToConstant: 102),
      
      
      navigationBackButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 16),
      navigationBackButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor, constant: 20),
      navigationTitle.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
      navigationTitle.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor, constant: 20),
      
      
      qrVideoView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 0),
      qrVideoView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      qrVideoView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      qrVideoView.bottomAnchor.constraint(equalTo: scanFoodButton.topAnchor, constant: -32),
      
      scanFoodButton.topAnchor.constraint(equalTo: qrVideoView.bottomAnchor, constant: 32),
      scanFoodButton.centerXAnchor.constraint(equalTo: qrVideoView.centerXAnchor),
      scanFoodButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -56),
      
    ])
   
  }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
  func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
    guard error == nil, let photoData = photo.fileDataRepresentation() else {
      print("Fotoğraf işlenirken hata oluştu: \(String(describing: error))")
      return
    }
    
    let image = UIImage(data: photoData)
    print("fotoğraf çekildi........ \(image)")
      // Fotoğraf çekildi, şimdi kaydedebilir veya görüntüleyebilirsiniz
  }
}
