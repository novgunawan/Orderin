//
//  OrderNowButton.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import UIKit

class OrderNowButton: UIView {
    
    let orderNowButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Order Now", for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold , size: 17)
        button.backgroundColor = .red
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintButton()
        addSubview(orderNowButton)
    }
    
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintButton() {
        
        NSLayoutConstraint.activate([
            
            orderNowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            orderNowButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16.0),
            orderNowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            orderNowButton.heightAnchor.constraint(equalToConstant: 53.0)
            
        ])
        
    }
    
    
}
