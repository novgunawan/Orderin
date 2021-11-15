//
//  OrderSummaryTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {

    //UI Table View
    @IBOutlet weak var orderSummaryDetailTable: UITableView!{
        didSet{
            orderSummaryDetailTable.frame.size.height = (20 * 3)
        }
    }
    
    //UI Cell View
    @IBOutlet weak var orderSummaryCellView: UIView!{
        didSet{
            orderSummaryCellView.frame.size.height = 68 + (20 * 3)
            orderSummaryCellView.layer.cornerRadius = 13
        }
    }
    
    //UI Total Item View
    @IBOutlet weak var totalItemView: UIView!{
        didSet{
            totalItemView.layer.cornerRadius = 5
            totalItemView.layer.borderWidth = 1
            totalItemView.layer.borderColor = UIColor(red: 0.87, green: 0.87, blue: 0.82, alpha: 1).cgColor
        }
    }
    
    //TODO: Get database for normal price (menggunakan didset)
    @IBOutlet weak var normalPrice: UILabel!{
        didSet{
            //Content Normal Price (GET DATA FROM DATABASE HERE)
            normalPrice.text = " "
            //normalPrice.text = "Rp 30.000"
            
            //Strikethrough UI
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: normalPrice.text ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            normalPrice.attributedText = attributeString
        }
    }
    
    //TODO: Get database for discount price (menggunakan didset)
    @IBOutlet weak var priceLabel: UILabel!{
        didSet{
            //If Statement for promo or not (position price label)
            if normalPrice.text == " "{
                priceLabel.frame = CGRect(x: 275, y: 11, width: 79, height: 24)
            }
            else{
            priceLabel.frame = CGRect(x: 275, y: 22, width: 79, height: 24)
            }
        }
    }
    
    //TODO: Get database for total item (menggunakan didset)
    @IBOutlet weak var totalItemLabel: UILabel!
    
    
    //create identifier XIB
    static let identifier = "cellOrderSummary"
    static func nib() -> UINib{
        return UINib(nibName: "OrderSummaryTableViewCell", bundle: nil)
    }
    
    //TODO: Get database for menu name label (menggunakan didset)
    @IBOutlet weak var nameMenuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //xib register
        orderSummaryDetailTable.register(OrderSummaryDetailTableViewCell.nib(), forCellReuseIdentifier: OrderSummaryDetailTableViewCell.identifier)
        orderSummaryDetailTable.register(NoteforMenuTableViewCell.nib(), forCellReuseIdentifier: NoteforMenuTableViewCell.identifier)
        
        orderSummaryDetailTable.delegate = self
        orderSummaryDetailTable.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
