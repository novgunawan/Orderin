//
//  CartButtonTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class CartButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var viewCell: UIView!{
        didSet{
        viewCell.layer.cornerRadius = 13
        }
    }
    @IBOutlet weak var cartButton: UIButton!
    
    //create identifier XIB
    static let identifier = "cellCartButton"
    static func nib() -> UINib{
        return UINib(nibName: "CartButtonTableViewCell", bundle: nil)
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
