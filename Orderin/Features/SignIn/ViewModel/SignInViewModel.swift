//
//  SignInViewModel.swift
//  Orderin
//
//  Created by Novi Gunawan on 27/10/21.
//

import Foundation
import AuthenticationServices

class SignInViewModel: NSObject {
    static var authenticationManager = AuthenticationManager()
    static var signinViewController = SignInViewController()
    @objc func handleSignInwithAppleTapped() {
        performSignIn()
    }
    
    
}
extension SignInViewModel: ASAuthorizationControllerDelegate {
    func performSignIn() {
        let request = SignInViewModel.authenticationManager.createAppleIDRequest()
        request.requestedScopes = [.fullName, .email]
        
        // MARK: Present Apple Authorization form
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}

extension SignInViewModel: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return SignInViewModel.signinViewController.view.window!
    }
}
