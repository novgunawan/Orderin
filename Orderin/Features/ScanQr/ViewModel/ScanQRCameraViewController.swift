//
//  ScanQRCameraViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 05/11/21.
//

import UIKit
import AVFoundation

class ScanQRCameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{

    @IBOutlet weak var labelInformation: UILabel!
    @IBOutlet weak var cameraPreview: UIView!
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
          super.viewDidLoad()

          captureSession = AVCaptureSession()

          guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
          let videoInput: AVCaptureDeviceInput

          do {
              videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
          } catch {
              return
          }

          if (captureSession.canAddInput(videoInput)) {
              captureSession.addInput(videoInput)
          } else {
              failed()
              return
          }

          let metadataOutput = AVCaptureMetadataOutput()

          if (captureSession.canAddOutput(metadataOutput)) {
              captureSession.addOutput(metadataOutput)

              metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
              metadataOutput.metadataObjectTypes = [.qr]
          } else {
              failed()
              return
          }

        //Assign camera to UIView
          previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
          previewLayer.frame = cameraPreview.layer.bounds
          previewLayer.videoGravity = .resizeAspectFill
          cameraPreview.layer.addSublayer(previewLayer)

          captureSession.startRunning()
      }

    //Failed Scan QR
      func failed() {
          labelInformation.text = "Fail to detect QR. Please place your camera over the entire QR."
          //          let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
          //          ac.addAction(UIAlertAction(title: "OK", style: .default))
          //          present(ac, animated: true)
          //          captureSession = nil
      }

    
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)

          if (captureSession?.isRunning == false) {
              captureSession.startRunning()
          }
      }

    
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)

          if (captureSession?.isRunning == true) {
              captureSession.stopRunning()
          }
      }

    //Get the metadata object
      func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
          captureSession.stopRunning()

          if let metadataObject = metadataObjects.first {
              guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
              guard let stringValue = readableObject.stringValue else { return }
              AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
              found(code: stringValue)
              gotoMenuList()
          }

          dismiss(animated: true)
      }

    //Funtion When QR Detect
      func found(code: String) {
          print(code)
      }

      override var prefersStatusBarHidden: Bool {
          return true
      }
    
    //Roatation Device
      override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .portrait
      }
    
    //go to menu list
    func gotoMenuList(){
    let menulistVC = MenuListViewController()
    self.navigationController?.pushViewController(menulistVC, animated: true)
    }
}
