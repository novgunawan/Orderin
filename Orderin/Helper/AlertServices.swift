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
            onVC.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            onVC.view.window?.rootViewController = SignInViewController()
        }
        
        // MARK: Not Now Action Handler
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            signinAlertVC.dismiss(animated: true, completion: nil)
        }
        
        let actions = [signinAction, cancelAction]
        for action in actions {
            signinAlertVC.addAction(action)
        }
        onVC.present(signinAlertVC, animated: true, completion: nil)
    }
}
