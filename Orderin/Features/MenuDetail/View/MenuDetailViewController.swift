//
//  MenuDetailViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    // MARK: -Outlets

    @IBOutlet weak var detailListTable: UITableView!
    @IBOutlet weak var topCursor: UIView!{
        didSet{
            topCursor.layer.cornerRadius = 2.5
        }
    }
    @IBOutlet weak var normalPrice: UILabel!{
        didSet{
            // MARK: Strikethrough label
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: normalPrice.text ?? "")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            normalPrice.attributedText = attributeString
            
        }
    }
    
    // MARK: -Outlets
  
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foodName: UILabel!

    // MARK: -Declaration Variables

    var menuDetailViewModel = MenuDetailViewModel()
    var customization: [Customization] = []
    var dataObject: MenuListModel?
    var orderedMenu: [OrderedMenu]?
    
    
    // MARK: -App Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        menuDetailViewModel.assignDataCustomization { value in
            self.customization = value
            self.setupComponents()
            
            DispatchQueue.main.async {
                self.detailListTable.reloadData()
            }
        }
    }
    
    // MARK: - Setup Function
    
   private func setup(){
       
       //xib register cell
       detailListTable.register(ChooseTableViewCell.nib(), forCellReuseIdentifier: ChooseTableViewCell.identifier)
       detailListTable.register(OptionalTableViewCell.nib(), forCellReuseIdentifier: OptionalTableViewCell.identifier)
       detailListTable.register(NotesTableViewCell.nib(), forCellReuseIdentifier: NotesTableViewCell.identifier)
       detailListTable.register(TotalItemTableViewCell.nib(), forCellReuseIdentifier: TotalItemTableViewCell.identifier)
       detailListTable.register(CartButtonTableViewCell.nib(), forCellReuseIdentifier: CartButtonTableViewCell.identifier)
       
       detailListTable.delegate = self
       detailListTable.dataSource = self
       
       //keyboard manage
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       self.dismissKeyboard()
    }
    
    // MARK: Setup top components
    
    func setupComponents(){
        guard let data = dataObject else { return  }
        
        imageMenu.image = data.image
        priceLabel.text = data.price
        descriptionLabel.text = data.description
        foodName.text = data.title
 
    }
    
    // MARK: - Logic Function 
    
    
    
}
