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
    var tabBarTag: Bool = true
    
    // MARK: -Properties
    
    // MARK: Scan QR Button
    lazy var scanQRButton: UIButton = {
        let button = UIButton()
        button.setTitle("Scan QR Code", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        
        return button
    }()
    
    // MARK: Sign Out Button
    let signoutButton: UIButton = {
        let button = UIButton()
        button.setTitle(C.signoutButton, for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signout), for: .touchUpInside)
        return button
    }()
    
    // MARK: Menu List Button
    let menulistButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("Menu List", for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToMenuListVC), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: -App Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Set selected tab bar item's color
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = C.hexStringToUIColor(hex: C.teal50)
        } else {
            self.tabBarController?.tabBar.tintColor = C.hexStringToUIColor(hex: C.gray70)
        }
        
        // MARK: Set Tab Bar Not To Be Hidden
        self.tabBarController?.tabBar.isHidden = false
        // MARK: Set navigation bar hidden [the large title in the left]
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scanQRButton.translatesAutoresizingMaskIntoConstraints = false
        scanQRButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        scanQRButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        scanQRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        scanQRButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        // MARK: Constraint Sign Out Button
        
        signoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 72.0).isActive = true
        signoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0).isActive = true
        signoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10.0).isActive = true
        
        // MARK: Constraint Menu List Button
        // TODO: Fix placement button
        
        menulistButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110.0).isActive = true
        menulistButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scanQRButton)
        view.addSubview(signoutButton)
        view.addSubview(menulistButton)
        cancelOrder()
        view.backgroundColor = .white
    }
    
    // MARK: -Functions
    
    @objc func scanQR() {
        // MARK: Check user has signed in or not
        
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                // MARK: User is signed in.
                // TODO: Go to Scan QR
                print("Scan QR")
            } else {
                // MARK: User is signed in.
                AlertServices.presentAlertSignedIn(onVC: self, message: "To Scan QR Code, you need to sign in first")
            }
        })
    }
    
    @objc func signout() {
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                // MARK: User is signed in.
                
                let firebaseAuth = Auth.auth()
                let user = Auth.auth().currentUser
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                user?.delete { error in
                    if let error = error {
                        // An error happened.
                    } else {
                        // Account deleted.
                        print("acount deleted")
                    }
                }
            } else {
                // MARK: User is not signed in.
                print("from home view controller : you haven't even signed in")
            }
        })
    }
    
    
    // MARK: Go to Menu List
    @objc func goToMenuListVC() {
        let menulistVC = MenuListViewController()
        self.navigationController?.pushViewController(menulistVC, animated: true)
    }
    
    @IBAction func menuDetailDidtTapped(_ sender: Any) {
        let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: Cancel Order
    func cancelOrder() {
        
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 250, height: 50)
        button.backgroundColor = UIColor.red
        button.setTitle("Cancel Order Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let cancelViewController = CancelOrderViewController(nibName: Constant.CancelOrder.cancelViewController, bundle: nil)
        cancelViewController.modalPresentationStyle = .fullScreen
        self.present(cancelViewController, animated: true, completion: nil)
        
    }
    
}

