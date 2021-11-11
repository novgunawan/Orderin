//
//  NotesView.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import UIKit

class NotesView: UIView {
    
    
    let notesTextField: UITextField = {
        let notesTextField = UITextField()
        
        notesTextField.placeholder = "E.g: Add 1 more Bowl"
        notesTextField.font = UIFont.systemFont(ofSize: 17)
        notesTextField.borderStyle = UITextField.BorderStyle.roundedRect
        notesTextField.frame = CGRect(x: 0, y: 0, width: 150, height: 20)
        
        return notesTextField
        
    }()
    
    let labelSubTotal: UILabel = {
       let label = UILabel()
        
        label.text = "Sub total"
        label.font = UIFont(name: C.fontPoppinsRegular, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelSubTotal)
        subTotalConstraint()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func subTotalConstraint() {
        labelSubTotal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        labelSubTotal.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        labelSubTotal.widthAnchor.constraint(equalToConstant: 72).isActive = true
        labelSubTotal.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    
}
