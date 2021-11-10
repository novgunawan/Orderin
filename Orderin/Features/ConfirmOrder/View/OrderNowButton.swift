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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Order Now", for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold , size: 17)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayoutButton()
        addSubview(orderNowButton)
    }
    
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        autoLayoutButton()
        fatalError("init(coder:) has not been implemented")
    }

    func autoLayoutButton() {
        
        orderNowButton.frame = CGRect(x: 16, y: 25, width: 359, height: 53)
//        NSLayoutConstraint.activate([
//            orderNowButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            orderNowButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            orderNowButton.widthAnchor.constraint(equalToConstant: 359),
//            orderNowButton.heightAnchor.constraint(equalToConstant: 53)
//
//
//        ])
    }
}
