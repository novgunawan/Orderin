//
//  OrderSummaryViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryViewController: UIViewController {

    @IBOutlet weak var orderSummaryTable: UITableView!
    
    //UI bottom view
    @IBOutlet weak var bottomView: UIView!{
        didSet{
            bottomView.layer.cornerRadius = 5
        }
    }
    //UI Add Order Button
    @IBOutlet weak var addOrderButton: UIButton!{
        didSet{
            addOrderButton.layer.cornerRadius = 13
        }
    }
    //UI Price View
    @IBOutlet weak var priceView: UIView!{
        didSet{
            priceView.layer.cornerRadius = 5
        }
    }
    
    //UI Normal Price
    // TO-DO: Get data normal price in database here
    @IBOutlet weak var normalPrice: UILabel!{
        didSet{
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: normalPrice.text ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            normalPrice.attributedText = attributeString
        }
    }
    
    // TO-DO: Get data discount price in database here (use didset)
    @IBOutlet weak var discountPrice: UILabel!
    
    // TO-DO: Get data tax price in database here and func calculation (use didset)
    @IBOutlet weak var taxPrice: UILabel!
    
    // TO-DO: Get data service price in database here and func calculation (use didset)
    @IBOutlet weak var serviceTax: UILabel!
    
    // TO-DO: Get data total price in database here and func calculation (use didset)
    @IBOutlet weak var totalPrice: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    //setup for viewDidLoad
    private func setup(){
        
        orderSummaryTable.register(OrderIDTableViewCell.nib(), forCellReuseIdentifier: OrderIDTableViewCell.identifier)
        orderSummaryTable.register(OrderSummaryTableViewCell.nib(), forCellReuseIdentifier: OrderSummaryTableViewCell.identifier)
        orderSummaryTable.register(NotesSummaryOrderTableViewCell.nib(), forCellReuseIdentifier: NotesSummaryOrderTableViewCell.identifier)
      
        
        orderSummaryTable.delegate = self
        orderSummaryTable.dataSource = self

    }
    
    //back button
    @IBAction func backButton(_ sender: Any) {
        let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: false, completion: nil)
    }
}
