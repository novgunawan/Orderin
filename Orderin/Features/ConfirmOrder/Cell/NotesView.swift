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
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(notesTextField)
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
