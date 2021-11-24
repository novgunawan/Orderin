//
//  HistoryViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    
    // MARK: UI Components
    
    let emptyStatesUI: UIImageView = {
        let emtpyStateUI = UIImageView()
        emtpyStateUI.image = UIImage(named: Constant.OrderHistory.orderHistoryEmptyState)
        emtpyStateUI.translatesAutoresizingMaskIntoConstraints = false
        
        return emtpyStateUI
    }()
    
    // TODO: Labelnya belom jalan autolayoutnya juga karena addtoFront View
    
    let emptyStatelabel: UILabel = {
        let label = UILabel()
        label.text = Constant.OrderHistory.historyEmptyLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: C.fontPoppinsRegular , size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.disabledWhite)
        label.textAlignment = .center
        label.layer.zPosition = 1
        
        return label
    }()
    
    
    // MARK: -App Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.addSubview(emptyStatesUI)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emptyStateConstraint()
    }
    
    func setup() {
        navigationItem.title = "Order History"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        view.addSubview(emptyStatesUI)
        view.addSubview(emptyStatelabel)
    }
    
    func emptyStateConstraint() {
        emptyStatesUI.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        emptyStatesUI.heightAnchor.constraint(equalToConstant: 520).isActive = true
        emptyStatesUI.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyStatesUI.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // TODO: Auto Layout Labelnya belom jalan -> karena bringSubviewToFront
        
        emptyStatelabel.trailingAnchor.constraint(equalTo: emptyStatesUI.trailingAnchor, constant: 0).isActive = true
        emptyStatelabel.leadingAnchor.constraint(equalTo: emptyStatesUI.leadingAnchor, constant: 0).isActive = true
        emptyStatelabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        emptyStatelabel.bottomAnchor.constraint(equalTo: emptyStatesUI.bottomAnchor, constant: 0).isActive = true
    }
}
