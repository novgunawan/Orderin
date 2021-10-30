//
//  MenuDetailViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class MenuDetailViewController: UIViewController {

    @IBOutlet weak var detailListTable: UITableView!
    
    @IBOutlet weak var topCursor: UIView!{
        didSet{
            topCursor.layer.cornerRadius = 2.5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   private func setup(){
       //xib register
        detailListTable.register(OptionalTableViewCell.nib(), forCellReuseIdentifier: OptionalTableViewCell.identifier)
       detailListTable.delegate = self
       detailListTable.dataSource = self
    }
}

//Function to push this modal
//let vc = MenuDetailViewController()
// vc.modalPresentationStyle = .formSheet
// self.present(vc, animated: true, completion: nil)
