//
//  FoodItemTableViewCell.swift
//  customBottomSheet
//
//  Created by Nathaniel Andrian on 03/11/21.
//

import UIKit

protocol EditbuttonDelegate {
    
    func buttonEdit(tag: Int)
}


class FoodItemTableViewCell: UITableViewCell {
    
    // MARK: - UI Components Declaration
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
    
    let editButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Edit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.addTarget(self, action: #selector(didEditButtonTapped), for: .touchUpInside)
       
        
        return button
    }()
    
    let customizeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BBQ Sauce, French Fries"
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.numberOfLines = 2
        
        return label
    }()
    
    // MARK: - Delegate Declaration
    var delegate: EditbuttonDelegate?
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(quantitiyLabel)
        self.contentView.addSubview(titleOrderLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(customizeLabel)
        self.contentView.addSubview(editButton)
        setQuantityLabelConstraint()
        setTitleOrderLabelConstarint()
        setPriceLabelConstraint()
        setCustomizeConstraint()
        setEditButtonConstraint()
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
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant:  -19.0 ).isActive = true
    }
    
    func setCustomizeConstraint(){
        
        customizeLabel.topAnchor.constraint(equalTo: quantitiyLabel.bottomAnchor, constant: 16.0).isActive = true
        customizeLabel.leadingAnchor.constraint(equalTo: titleOrderLabel.leadingAnchor).isActive = true
        customizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -19.0).isActive = true
    }
    
    func setEditButtonConstraint(){
        editButton.topAnchor.constraint(equalTo: customizeLabel.bottomAnchor, constant: 12.0).isActive = true
        editButton.leadingAnchor.constraint(equalTo: titleOrderLabel.leadingAnchor).isActive = true
     
    }
    
    
    // MARK: - Cell Content
    
    func setContent(quantity: String, titleOrder: String, price: String){
        
        quantitiyLabel.text = "\(quantity)X"
        titleOrderLabel.text = titleOrder
        priceLabel.text = price
        
    }
    
    // MARK: - Logic
    
    @objc func didEditButtonTapped(_ sender: UIButton){
        delegate?.buttonEdit(tag: sender.tag)

    }
    
    
  
}
