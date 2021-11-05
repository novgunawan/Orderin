//
//  OptionalDetailTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class OptionalDetailTableViewCell: UITableViewCell {
 
    @IBOutlet weak var checkerUI: UIImageView!
    
    @IBOutlet weak var optionalNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //create identifier XIB
    static let identifier = "cellOptionalDetail"
    static func nib() -> UINib{
        return UINib(nibName: "OptionalDetailTableViewCell", bundle: nil)
    }
}
