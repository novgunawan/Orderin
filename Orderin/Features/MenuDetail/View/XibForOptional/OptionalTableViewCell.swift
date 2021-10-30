//
//  OptionalTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class OptionalTableViewCell: UITableViewCell {

    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var optionalTitleLabel: UILabel!{
        didSet{
            optionalTitleLabel.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var viewCell: UIView!
    static let identifier = "cell"
    static func nib() -> UINib{
        return UINib(nibName: "OptionalTableViewCell", bundle: nil)
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
