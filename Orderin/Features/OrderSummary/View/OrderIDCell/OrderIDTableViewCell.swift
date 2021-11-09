//
//  OrderIDTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderIDTableViewCell: UITableViewCell {
    
    //create identifier XIB
    static let identifier = "cell"
    static func nib() -> UINib{
        return UINib(nibName: "OrderIDTableViewCell", bundle: nil)
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
