//
//  ScanQRViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 04/11/21.
//

import UIKit
import AVFoundation

class ScanQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
//    var video = AVCaptureVideoPreviewLayer()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    func setup(){
//        //Creating Session
//        let session = AVCaptureSession()
//
//        //Define Capture Device
//        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
//
//        do{
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            session.addInput(input)
//        }
//        catch{
//            print("Error")
//        }
//
//        let output = AVCaptureMetadataOutput()
//        session.addOutput(output)
//
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//        output.metadataObjectTypes = [AVMetadataObjectTy]
//    }
    var captureSession: AVCaptureSession!
      var previewLayer: AVCaptureVideoPreviewLayer!

      override func viewDidLoad() {
          super.viewDidLoad()

          view.backgroundColor = UIColor.black
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

          previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
          previewLayer.frame = view.layer.bounds
          previewLayer.videoGravity = .resizeAspectFill
          view.layer.addSublayer(previewLayer)

          captureSession.startRunning()
      }

      func failed() {
          let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
          ac.addAction(UIAlertAction(title: "OK", style: .default))
          present(ac, animated: true)
          captureSession = nil
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
              DispatchQueue.main.async {
                  print(stringValue)
              }
              found(code: stringValue)
          }

          dismiss(animated: true)
      }

      func found(code: String) {
          print(code)
      }

      override var prefersStatusBarHidden: Bool {
          return true
      }

      override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .portrait
      }
  
}
