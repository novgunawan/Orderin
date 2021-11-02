//
//  HomeViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit
import AuthenticationServices
import Firebase

class HomeViewController: UIViewController {

    static var signinViewController = SignInViewController()
    
    lazy var scanQRButton: UIButton = {
       let button = UIButton()
        button.setTitle("Scan QR Code", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scanQRButton)
     
    }
    @objc func scanQR() {
        // MARK: Check user has signed in or not
        
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                AlertServices.presentAlertSignedIn(onVC: self, message: "To Scan QR Code, you need to sign in first")
            } else {
                // TODO: Go to Scan QR
                print("Scan QR")
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scanQRButton.translatesAutoresizingMaskIntoConstraints = false
        scanQRButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        scanQRButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        scanQRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        scanQRButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

    @IBAction func menuDetailDidtTapped(_ sender: Any) {
       let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
}
