//
//  OrderSummaryTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var orderSummaryDetailTable: UITableView!{
        didSet{
            orderSummaryDetailTable.frame.size.height = (20 * 3)
        }
    }
    
    @IBOutlet weak var orderSummaryCellView: UIView!{
        didSet{
            orderSummaryCellView.frame.size.height = 68 + (20 * 3)
            orderSummaryCellView.layer.cornerRadius = 13
        }
    }
    
    @IBOutlet weak var totalItemView: UIView!{
        didSet{
            totalItemView.layer.cornerRadius = 5
            totalItemView.layer.borderWidth = 1
            totalItemView.layer.borderColor = UIColor(red: 0.87, green: 0.87, blue: 0.82, alpha: 1).cgColor
        }
    }
    //create identifier XIB
    static let identifier = "cellOrderSummary"
    static func nib() -> UINib{
        return UINib(nibName: "OrderSummaryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        orderSummaryDetailTable.register(OrderSummaryDetailTableViewCell.nib(), forCellReuseIdentifier: OrderSummaryDetailTableViewCell.identifier)
        orderSummaryDetailTable.register(NoteforMenuTableViewCell.nib(), forCellReuseIdentifier: NoteforMenuTableViewCell.identifier)
        
        orderSummaryDetailTable.delegate = self
        orderSummaryDetailTable.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
