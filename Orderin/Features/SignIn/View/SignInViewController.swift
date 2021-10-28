//
//  SignInViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 27/10/21.
//

import UIKit
import AuthenticationServices
class SignInViewController: UIViewController {
    static var signinViewModel = SignInViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupSignInButton() {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(SignInViewController.signinViewModel.handleSignInwithAppleTapped), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }

}

