//
//  NotesTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    //create identifier XIB
    static let identifier = "cellNotes"
    static func nib() -> UINib{
        return UINib(nibName: "NotesTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
