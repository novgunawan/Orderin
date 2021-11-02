//
//  SignInViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 27/10/21.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
class SignInViewController: UIViewController {
    
    let signinViewModel = SignInViewModel()
    
    lazy var signinButton: ASAuthorizationAppleIDButton = {
        setupSignInButton()
    }()
    
    // MARK: Property Title Label
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = C.titleLabel
        label.textAlignment = .center
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeTitle)
        return label
    }()
    
    let titleLabel2: UILabel = {
       let newLabel = UILabel()
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.text = C.titleLabel2
        newLabel.textAlignment = .center
        newLabel.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeTitle)
        
        return newLabel
    }()
    
    // MARK: Property Image
    let image: UIImageView = {
        var img = UIImage()
        img = UIImage(named: C.signinImg) ?? UIImage()
        var images = UIImageView(image: img)
        images.frame = CGRect(x: 50, y: 242, width: 291, height: 291)
        return images
    }()
    
    // MARK: Property Skip Button
    let skipButton: UIButton = {
       let button = UIButton()
        button.setTitle(C.titleskipButton, for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipSignin), for: .touchUpInside)
        return button
    }()
    
    // MARK: Property Sign in Button
    func setupSignInButton() -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleSignInwithAppleTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(signinButton)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(image)
        view.addSubview(skipButton)
    }
    
    @objc func skipSignin() {
        signinViewModel.skipButton(from: self)
//        print("button skip tapped")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // MARK: Constraint Title Label
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 63).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0).isActive = true
      
        
        // MARK: Constraint Title Label 2
        titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        titleLabel2.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0.0).isActive = true
        titleLabel2.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0.0).isActive = true
        
        // MARK: Constraint Image Sign In
        image.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 32.0).isActive = true
        
        // MARK: Constraint Sign In Button
        signinButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32.0).isActive = true
        signinButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24.0).isActive = true
        signinButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24.0).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 54.0).isActive = true
        
        // MARK: Constraint Skip Button
        skipButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 32.0).isActive = true
        skipButton.leadingAnchor.constraint(equalTo: signinButton.leadingAnchor, constant: 0.0).isActive = true
        skipButton.trailingAnchor.constraint(equalTo: signinButton.trailingAnchor, constant: 0.0).isActive = true
        
    }
    @objc func handleSignInwithAppleTapped() {
        signinViewModel.performSignIn()
    }
    

}

