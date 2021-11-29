//
//  EmptyStateViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 23/11/21.
//

import UIKit

class EmptyStateViewController: UIViewController {
    
    let viewPage: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emptyStatesUI: UIImageView = {
        let emtpyStateUI = UIImageView()
        emtpyStateUI.image = UIImage(named: Constant.ConfirmOrder.confirmOrderEmptyState)
        emtpyStateUI.contentMode = .scaleToFill
        emtpyStateUI.translatesAutoresizingMaskIntoConstraints = false
        return emtpyStateUI
    }()
    
    let emptyStatesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constant.ConfirmOrder.confirmOrderEmptyLabelhead
        label.numberOfLines = 0
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.disabledWhite)
        label.textAlignment = .center
        return label
        
    }()
    
    let emptyStatesDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constant.ConfirmOrder.confirmOrderEmptyDetail
        label.numberOfLines = 0
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.disabledWhite)
        label.textAlignment = .center
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPage.addSubview(emptyStatesUI)
        viewPage.addSubview(emptyStatesLabel)
        viewPage.addSubview(emptyStatesDetail)
        view.addSubview(viewPage)
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emptyStateConstraint()
    }
    
    func emptyStateConstraint() {
        viewPage.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        viewPage.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        viewPage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewPage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emptyStatesUI.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        emptyStatesUI.heightAnchor.constraint(equalToConstant: 500).isActive = true
        emptyStatesUI.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyStatesUI.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emptyStatesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyStatesLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        emptyStatesLabel.topAnchor.constraint(equalTo: emptyStatesUI.bottomAnchor, constant: 8).isActive = true
        
       
        emptyStatesDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        emptyStatesDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        emptyStatesDetail.topAnchor.constraint(equalTo: emptyStatesLabel.bottomAnchor, constant: 8).isActive = true
    }
    
}
