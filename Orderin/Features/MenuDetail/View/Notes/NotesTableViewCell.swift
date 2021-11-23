//
//  NotesTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class NotesTableViewCell: UITableViewCell, UITextFieldDelegate{
    @IBOutlet weak var notesTextField: UITextField!
    
    var notes: String = ""
    //create identifier XIB
    static let identifier = "cellNotes"
    static func nib() -> UINib{
        return UINib(nibName: "NotesTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        notesTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //dismiss keyboard when return button did tapped
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        notes = notesTextField.text ?? "no notes"
        Functionality.shared.tempNotes = notes
    }
    
}
