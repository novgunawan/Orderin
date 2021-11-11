//
//  NoteforMenuTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 10/11/21.
//

import UIKit

class NoteforMenuTableViewCell: UITableViewCell {

    //set note (GET DATA FROM DATABASE)
    @IBOutlet weak var noteforMenu: UILabel!
    
    
    //xib register
    static let identifier = "cellNoteMenu"
    static func nib() -> UINib{
        return UINib(nibName: "NoteforMenuTableViewCell", bundle: nil)
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
