//
//  ConfirmMenuCell.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import UIKit

class ConfirmMenuCell: UITableViewCell {
    
    // MARK: TableView Cell
    
    var menuCustomVM = CellConfirmationViewModel()
    var data: [OrderedMenuCustomizationDummyData] = []
    var delegate: editButtonDelegate?
    
    var quantitiyLabel: UILabel = {
        
        let label = UILabel()
        
        label.layer.borderColor = UIColor(named: "light gray")?.cgColor
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5.0
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.text = "1X"
        label.textAlignment = .center
        
        return label
    }()
    
    let titleOrderLabel: UILabel = {
       
        let label =  UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = "Steak"
        
        return label
    }()
    
    let priceLabel: UILabel = {
        
        let label =  UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = "Rp30.000"
        
        return label
    }()
    
    // MARK: Menu Customization
    let menuCustomizationTableView: UITableView = {
        
        let customizeMenu = UITableView()
        customizeMenu.separatorStyle = .none
        customizeMenu.translatesAutoresizingMaskIntoConstraints = false
        customizeMenu.allowsSelection = false
        return customizeMenu
        
    }()
    
    
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(quantitiyLabel)
        self.contentView.addSubview(titleOrderLabel)
        self.contentView.addSubview(priceLabel)
        setQuantityLabelConstraint()
        setTitleOrderLabelConstarint()
        setPriceLabelConstraint()
        cellAddSubviews()
        setTableViewConstraint()
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        
        menuCustomizationTableView.register(MenuCustomizationCell.self, forCellReuseIdentifier: Constant.ConfirmOrder.menuCustomCell)
        
        menuCustomizationTableView.register(EditButtonCell.self, forCellReuseIdentifier: Constant.ConfirmOrder.editButtonCell)
        
        menuCustomizationTableView.dataSource = self
        menuCustomizationTableView.delegate = self
 
        bindData()
       
    }
    
    func cellAddSubviews() {
        self.contentView.addSubview(menuCustomizationTableView)
    }
    
    
    // MARK: Auto Layout
    
    func setQuantityLabelConstraint(){
        
        quantitiyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0).isActive = true
        quantitiyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19.0).isActive = true
        quantitiyLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        quantitiyLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
    }

    func setTitleOrderLabelConstarint(){
        
        titleOrderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0).isActive = true
        titleOrderLabel.leadingAnchor.constraint(equalTo: quantitiyLabel.trailingAnchor, constant: 13.0).isActive = true
        
        
    }
    
    func setPriceLabelConstraint(){
        
        priceLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20.0).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: titleOrderLabel.trailingAnchor,constant: 165.0 ).isActive = true
    }
    
    func setTableViewConstraint() {
        
        menuCustomizationTableView.topAnchor.constraint(equalTo: titleOrderLabel.bottomAnchor, constant: 0).isActive = true
        menuCustomizationTableView.leadingAnchor.constraint(equalTo: quantitiyLabel.trailingAnchor, constant: 13.0).isActive = true
        menuCustomizationTableView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        menuCustomizationTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0) .isActive = true
      
    }
    
    // MARK: - Cell Content
    
    func setContent(quantity: String, titleOrder: String, price: String){
        
        quantitiyLabel.text = "\(quantity)X"
        titleOrderLabel.text = titleOrder
        priceLabel.text = price
        
    }
    
    // MARK: - Logic
    
    func bindData() {
        menuCustomVM.fetchMenuCustomization(completion: { value in
            
            self.data = value
        })
    }
  
}
