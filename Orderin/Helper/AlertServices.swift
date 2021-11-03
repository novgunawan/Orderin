//
//  AlertServices.swift
//  Orderin
//
//  Created by Novi Gunawan on 01/11/21.
//

import Foundation
import UIKit
class AlertServices {
    
    static func presentAlertSignedIn(onVC: UIViewController, message: String) {
        
        let signinAlertVC = UIAlertController(title: "Sign in to continue", message: message, preferredStyle: .alert)
        
        // MARK: Signed In Action Handler
        let signinAction = UIAlertAction(title: "Sign In", style: .default) { _ in
            let signinVC = SignInViewController()
            signinVC.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                onVC.present(signinVC, animated: true, completion: nil)
            }
        }
        
        // MARK: Cancel Action Handler
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            signinAlertVC.dismiss(animated: true, completion: nil)
        }
        
        // MARK: Add actions to alert VC
        let actions = [signinAction, cancelAction]
        for action in actions {
            signinAlertVC.addAction(action)
        }
        
        onVC.present(signinAlertVC, animated: true, completion: nil)
    }
}
