//
//  OrderSummaryViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit

class OrderSummaryViewController: UIViewController {

    @IBOutlet weak var orderSummaryTable: UITableView!
    
    //UI VIEW ON BOTTOM
    @IBOutlet weak var bottomView: UIView!{
        didSet{
            bottomView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var addOrderButton: UIButton!{
        didSet{
            addOrderButton.layer.cornerRadius = 13
        }
    }
    
    @IBOutlet weak var priceView: UIView!{
        didSet{
            priceView.layer.cornerRadius = 5
        }
    }
    
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
}
