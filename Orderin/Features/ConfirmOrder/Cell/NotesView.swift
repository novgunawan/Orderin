//
//  NotesView.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import UIKit

class NotesView: UITableViewHeaderFooterView {
    
    let notesTextField: UITextField = {
        let notesTextField = UITextField()
        notesTextField.translatesAutoresizingMaskIntoConstraints = false
        notesTextField.placeholder = "E.g: Add 1 more Bowl"
        notesTextField.font = UIFont.systemFont(ofSize: 17)
        notesTextField.borderStyle = UITextField.BorderStyle.roundedRect

        
        return notesTextField
        
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContent() {
        addSubview(notesTextField)
        notesTextField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        notesTextField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        notesTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    
    
    
    
}
