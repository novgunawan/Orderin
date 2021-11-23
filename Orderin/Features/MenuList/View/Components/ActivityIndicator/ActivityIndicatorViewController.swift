//
//  ActivityIndicatorViewController.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 22/11/21.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {
    
    let activitIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
        
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(activitIndicator)
        view.backgroundColor  = .white

        
    }
    
    override func viewDidLayoutSubviews() {
        activitIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
        activitIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    


}
