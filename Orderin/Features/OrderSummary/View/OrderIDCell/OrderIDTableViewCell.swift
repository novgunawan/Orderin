//
//  OrderIDTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderIDTableViewCell: UITableViewCell {
    
    //TO-DO: Get database for order id (menggunakan didset)
    @IBOutlet weak var orderIDLabel: UILabel!
    
    //TO-DO: Get database for time stamp (menggunakan didset)
    @IBOutlet weak var timeStampLabel: UILabel!
    
    //TO-DO: Get database for table number (menggunakan didset)
    @IBOutlet weak var numberTableLabel: UILabel!
    
    //create identifier XIB
    static let identifier = "cellOrderID"
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
