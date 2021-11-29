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
    var customizationOrderedMenu: CustomizationMenuOrdered?
    var customization: [Customization] = []
    var dataObject: MenuListModel?
    static var orderedMenu: [OrderedMenu] = []
    var menuID: String = ""
    var menuName: String = ""
    var menuPrice: String = ""
    var menuDesc: String = ""
    var qty: Int = 0
    
    
    
    // MARK: -App Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuDetailViewModel.assignDataCustomization { value in
            self.customization = value
            self.dataObject = TempMenuList.shared.menuModel
            self.setupComponents()
            
            DispatchQueue.main.async {
                self.detailListTable.reloadData()
            }
        }
        foodName.text = menuName
        descriptionLabel.text = menuDesc
        
        // MARK: Convert price into more appropriate view
        var stringPrice = menuPrice
//        stringPrice.insert(".", at: stringPrice.index(stringPrice.endIndex, offsetBy: -3))
        
        priceLabel.text = "Rp\(stringPrice)"
        
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

    // MARK: Set menu list's [foodName, image, price] to menu detail's [foodName, image, price]
    func setupComponents(){
        guard let data = dataObject else { return }
        menuID = data.menuID
        imageMenu.image = data.image
        menuPrice = data.price
        menuDesc = data.description
        menuName = data.title
 
    }
    
    // MARK: - Logic Function 
    
    
    
}
