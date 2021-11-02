//
//  SignInViewModel.swift
//  Orderin
//
//  Created by Novi Gunawan on 27/10/21.
//

import Foundation
import AuthenticationServices
import FirebaseAuth

class SignInViewModel: NSObject {
    static var authenticationManager = AuthenticationManager()
    static var signinViewController = SignInViewController()
    
    func performSignIn() {
        let request = SignInViewModel.authenticationManager.createAppleIDRequest()
        request.requestedScopes = [.fullName, .email]
        
        // MARK: Present Apple Authorization form
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @objc func skipButton(from: UIViewController) {
        let homeVC = TabbarViewController()
        from.dismiss(animated: true, completion: nil)
        from.view.window?.rootViewController = homeVC
    }
}
extension SignInViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            guard let nonce = SignInViewModel.authenticationManager.currentNonce else {
                fatalError("Invalid state: a login call back was received but no login request was sent")
            }
            
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return //do nothing
            }
            
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            Auth.auth().signIn(with: credential) { authDataResult, error in
                if let user = authDataResult?.user {
                    //MARK: Sign in successful
                    print(user.displayName)
                }
                if (error != nil) {
                    print("\(error?.localizedDescription)")
                }
            }
        }
    }
    
}

extension SignInViewModel: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return SignInViewModel.signinViewController.view.window!
    }
}
