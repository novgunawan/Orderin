//
//  ChooseDetailTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 03/11/21.
//

import UIKit

class ChooseDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "cellChooseDetail"
    static func nib() -> UINib{
        return UINib(nibName: "ChooseDetailTableViewCell", bundle: nil)
    }
    
}
