//
//  HistoryViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {

    // MARK: -App Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func setup() {
        navigationItem.title = "Order History"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
