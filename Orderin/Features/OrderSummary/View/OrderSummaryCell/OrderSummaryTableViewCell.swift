//
//  OrderSummaryTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var OrderSummaryDetailTable: UITableView!
    
    //create identifier XIB
    static let identifier = "cell"
    static func nib() -> UINib{
        return UINib(nibName: "OrderSummaryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
