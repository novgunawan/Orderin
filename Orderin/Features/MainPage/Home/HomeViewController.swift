//
//  HomeViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    static var signinViewController = SignInViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController.signinViewController.setupSignInButton()
        view.backgroundColor = .white
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
