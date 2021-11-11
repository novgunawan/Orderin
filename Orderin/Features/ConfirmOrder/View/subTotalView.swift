//
//  NotesView.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import UIKit

class subTotalView: UIView {
  
    
    let labelSubTotal: UILabel = {
        let label = UILabel()
        
        label.text = "Sub total"
        label.font = UIFont(name: C.fontPoppinsRegular, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let labelPrice = UILabel()
        
        labelPrice.text = "Rp 90.000"
        labelPrice.font = UIFont(name: C.fontPoppinsRegular, size: 15)
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        return labelPrice
    }()
    
    let infolabel: UILabel = {
        let labels = UILabel()
        
        labels.text = "Total price is not yet added with tax and service."
        labels.font = UIFont(name: C.fontPoppinsRegular, size: 13)
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.textColor = UIColor(named: "dark gray")
        labels.numberOfLines = 0
        return labels
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelSubTotal)
        addSubview(priceLabel)
        addSubview(infolabel)
        priceLabelConstraint()
        infoLabelConstraint()
        subTotalConstraint()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func subTotalConstraint() {
        labelSubTotal.leadingAnchor.constraint(equalTo: infolabel.leadingAnchor, constant: 0).isActive = true
        labelSubTotal.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        labelSubTotal.widthAnchor.constraint(equalToConstant: 72).isActive = true
        labelSubTotal.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func priceLabelConstraint() {
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -39).isActive = true
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
    }
    
    func infoLabelConstraint() {
        NSLayoutConstraint.activate([
            
            infolabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            infolabel.topAnchor.constraint(equalTo: labelSubTotal.bottomAnchor, constant: 16),
            infolabel.heightAnchor.constraint(equalToConstant: 17)
            
        ])
        
        
    }
    
    
}
