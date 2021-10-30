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
    @IBOutlet weak var normalPrice: UILabel!{
        didSet{
            //strikethrough label
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: normalPrice.text ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            normalPrice.attributedText = attributeString
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   private func setup(){
       //xib register cell
       detailListTable.register(OptionalTableViewCell.nib(), forCellReuseIdentifier: OptionalTableViewCell.identifier)
       detailListTable.register(ChooseTableViewCell.nib(), forCellReuseIdentifier: ChooseTableViewCell.identifier)
       detailListTable.register(NotesTableViewCell.nib(), forCellReuseIdentifier: NotesTableViewCell.identifier)
       detailListTable.register(TotalItemTableViewCell.nib(), forCellReuseIdentifier: TotalItemTableViewCell.identifier)
       detailListTable.register(CartButtonTableViewCell.nib(), forCellReuseIdentifier: CartButtonTableViewCell.identifier)
       
       detailListTable.delegate = self
       detailListTable.dataSource = self
    }
}

//Function to push this modal
//let vc = MenuDetailViewController()
// vc.modalPresentationStyle = .formSheet
// self.present(vc, animated: true, completion: nil)
