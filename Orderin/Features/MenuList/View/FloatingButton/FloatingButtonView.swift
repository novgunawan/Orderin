//
//  FloatingButtonView.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 05/11/21.
//

import UIKit

class FloatingButtonView: UIView {
    
    // MARK: - Declare UI Components
    
    let cartImage: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image  = UIImage(systemName: "cart")
        image.tintColor = .white
        
        
        return image
    }()
    
    let itemsLabel: UILabel = {
        
       let label = UILabel()
        
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = "0 Items"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
                
        
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = "Rp0"
        label.textColor = .white
        
        
        return label
        
    }()
    
    let cartButton: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13.0
        view.backgroundColor = C.hexStringToUIColor(hex: C.red50)
        
        
        return view
    }()
    
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSubview(cartButton)
        
        cartButton.addSubview(cartImage)
        cartButton.addSubview(itemsLabel)
        cartButton.addSubview(totalPriceLabel)
        setButtonConstraint()
        setButtonElementConstraint()
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didCartButtonTapped))
        cartButton.addGestureRecognizer(gestureRecognizer)
       
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 20.0
//        self.backgroundColor = .systemMint
        self.backgroundColor = C.hexStringToUIColor(hex: "FBFBFB")
        self.layer.shadowColor = C.hexStringToUIColor(hex: "#979797").cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0.0,height: -5.0)
        self.layer.shadowRadius = 4
        
     
    }
    
    private func setButtonConstraint(){
        
        NSLayoutConstraint.activate([
            
            cartButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cartButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16.0),
            cartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            cartButton.heightAnchor.constraint(equalToConstant: 53.0)
            
        ])
    }
    
    private func setButtonElementConstraint(){
        
        NSLayoutConstraint.activate([
            
            cartImage.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor),
            cartImage.leadingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: 21.0),
            cartImage.heightAnchor.constraint(equalToConstant: 18.0),
            cartImage.widthAnchor.constraint(equalToConstant: 18.0),
            
            itemsLabel.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor),
            itemsLabel.leadingAnchor.constraint(equalTo: cartImage.trailingAnchor,constant: 7.0),
            
            totalPriceLabel.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor,constant: -21.0)
        
        ])
    }
    
    @objc func didCartButtonTapped(){
        
        // TODO: Go to summary page

    }
    
    
}
