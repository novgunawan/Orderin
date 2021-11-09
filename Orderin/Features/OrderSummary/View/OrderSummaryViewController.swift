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
            bottomView.backgroundColor = .darkGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //setup for viewDidLoad
    private func setup(){
        orderSummaryTable.delegate = self
        orderSummaryTable.dataSource = self
    }
}
