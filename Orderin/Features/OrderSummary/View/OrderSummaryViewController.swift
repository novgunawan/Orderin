//
//  OrderSummaryViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import UIKit
protocol addNewMenuDelegate {
    func addOrder()
    func dropButtonNav()
}

class OrderSummaryViewController: UIViewController {
    
    // View model declaration
    let orderSumamryVM = OrderSummaryViewModel()

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
    // TODO: Get data normal price in database here
    @IBOutlet weak var normalPrice: UILabel!{
        didSet{
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: normalPrice.text ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            normalPrice.attributedText = attributeString
        }
    }
    
    // TODO: Get data discount price in database here (use didset)
    @IBOutlet weak var discountPrice: UILabel!
    
    // TODO: Get data tax price in database here and func calculation (use didset)
    @IBOutlet weak var taxPrice: UILabel!
    
    // TODO: Get data service price in database here and func calculation (use didset)
    @IBOutlet weak var serviceTax: UILabel!
    
    // TODO: Get data total price in database here and func calculation (use didset)
    @IBOutlet weak var totalPrice: UILabel!
    
    
    var delegate: addNewMenuDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        orderSumamryVM.fetchDataOrderFromFireStoreDatabase(userID: "w21rnUp1OLtWHmoEAaim", orderID: "mZybgJ", tableNumber: UserDefaults.standard.integer(forKey: "tableNumber"))
        
    }

    //setup for viewDidLoad
    private func setup(){
        
        orderSummaryTable.register(OrderIDTableViewCell.nib(), forCellReuseIdentifier: OrderIDTableViewCell.identifier)
        orderSummaryTable.register(OrderSummaryTableViewCell.nib(), forCellReuseIdentifier: OrderSummaryTableViewCell.identifier)
        orderSummaryTable.register(NotesSummaryOrderTableViewCell.nib(), forCellReuseIdentifier: NotesSummaryOrderTableViewCell.identifier)
      
        
        orderSummaryTable.delegate = self
        orderSummaryTable.dataSource = self

    }
    
    // Order Button Action
    @IBAction func addOrderButtonDidTapped(_ sender: Any) {

        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
            self.popVC()
        })
    }
    
    func popVC() {
        delegate?.addOrder()
    }
    
    func popRootVC() {
        delegate?.dropButtonNav()
    }
    
    @IBAction func dropDownButtonAction(_ sender: Any) {
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
            self.popRootVC()
        })
    }
    
}
