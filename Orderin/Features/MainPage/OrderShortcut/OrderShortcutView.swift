//
//  OrderShortcut.swift
//  Orderin
//
//  Created by Novi Gunawan on 04/11/21.
//

import UIKit

class OrderShortcutView: UIView {
    
    // MARK: Properties
    var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeTitle2)
        label.text = "Restaurant's Name"
        label.layer.zPosition = 1
        return label
    }()
    
    var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.textColor = C.hexStringToUIColor(hex: C.gray70)
        label.text = "Click here to see your order"
        label.layer.zPosition = 1
        return label
    }()
    
    var tableLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.gray70)
        label.text = "Table"
        label.layer.zPosition = 1
        return label
        
    }()
    
    var tableNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.black90)
        label.text = "12"
        label.layer.zPosition = 1
        return label
    }()
    
    var image: UIImageView = {
        var image = UIImage()
        image = UIImage(named: C.orderShortcutImg) ?? UIImage()
        var images = UIImageView(image: image)
        images.translatesAutoresizingMaskIntoConstraints = false
        return images
        
    }()
    
    var delegate: NavigationControllerDelegate?
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        setup()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToConfirmOrder))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
  
    // MARK: -Functions
    
    
    // TODO: Go to order list
    @objc func goToConfirmOrder() {
        delegate?.pushToOrderSummary()

    }
    private func setup() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        self.addSubview(restaurantNameLabel)
        self.addSubview(instructionLabel)
        self.addSubview(tableLabel)
        self.addSubview(tableNumberLabel)
        self.backgroundColor = C.hexStringToUIColor(hex: C.white)
        NSLayoutConstraint.activate([
            
            // MARK: Constraint Restaurant Name Label
            restaurantNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 19.0),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.5),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.5),


            // MARK: Constraint Instruction Label
            instructionLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: -33.0),
            instructionLabel.leadingAnchor.constraint(equalTo: restaurantNameLabel.leadingAnchor, constant: 0.0),
            instructionLabel.trailingAnchor.constraint(equalTo: restaurantNameLabel.trailingAnchor, constant: 0.0),

            // MARK: Constraint Table Label
            tableLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 16.0),
            tableLabel.leadingAnchor.constraint(equalTo: instructionLabel.leadingAnchor, constant: 0.0),
            tableLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -21.0),


            // MARK: Constraint Table Number Label
            tableNumberLabel.topAnchor.constraint(equalTo: tableLabel.topAnchor, constant: 0.0),
            tableNumberLabel.leadingAnchor.constraint(equalTo: tableLabel.trailingAnchor, constant: 10.0),
            tableNumberLabel.bottomAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: 0.0),
            
            
            // MARK: Constraint Order Shortcut Image
            image.topAnchor.constraint(equalTo: restaurantNameLabel.topAnchor, constant: 3.0),
            image.heightAnchor.constraint(equalToConstant: 113.0),
            image.widthAnchor.constraint(equalToConstant: 113.0),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17.5),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 228.5)
        ])
        
    }

}
