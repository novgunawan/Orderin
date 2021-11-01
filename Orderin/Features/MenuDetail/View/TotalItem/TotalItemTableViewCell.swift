//
//  TotalItemTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class TotalItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var minusButton: UIButton!{
        didSet{
            minusButton.layer.cornerRadius = 13
            minusButton.layer.borderWidth = 1
            minusButton.layer.borderColor = UIColor(red: 0.87, green: 0.87, blue: 0.82, alpha: 1).cgColor
        }
    }
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!{
        didSet{
            plusButton.layer.cornerRadius = 13
            plusButton.layer.borderWidth = 1
            plusButton.layer.borderColor = UIColor(red: 0.87, green: 0.87, blue: 0.82, alpha: 1).cgColor
        }
    }
    
    //create identifier XIB
    static let identifier = "cellTotalItem"
    static func nib() -> UINib{
        return UINib(nibName: "TotalItemTableViewCell", bundle: nil)
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
