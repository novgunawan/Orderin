//
//  ChooseTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class ChooseTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
        {
            didSet{
                //corner radius
                viewCell.layer.cornerRadius = 5
                //shadow
                viewCell.layer.shadowColor = UIColor.black.cgColor
                viewCell.layer.shadowOpacity = 0.2
                        viewCell.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
            }
        }
    //create identifier XIB
    static let identifier = "cellChoose"
    static func nib() -> UINib{
        return UINib(nibName: "ChooseTableViewCell", bundle: nil)
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
