//
//  OrderSummaryDetailTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryDetailTableViewCell: UITableViewCell {

    //TO-DO: Get database for detail menu (menggunakan didset)
    @IBOutlet weak var detailMenuLabel: UILabel!
    
    //xib register
    static let identifier = "cellOrderSummaryDetail"
    static func nib() -> UINib{
        return UINib(nibName: "OrderSummaryDetailTableViewCell", bundle: nil)
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
