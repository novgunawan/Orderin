//
//  MenuCustomizationCell.swift
//  Orderin
//
//  Created by Azka Kusuma on 10/11/21.
//

import UIKit

class MenuCustomizationCell: UITableViewCell {
    
    var whatMenuCustom: OrderedMenuCustomizationDummyData? {
        didSet {
            changeText()
        }
    }
        
    let menuCustomization: UILabel = {
       
        let label =  UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: 15)
        label.text = "French Fries"
        
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(menuCustomization)
        setConstraintOnLabel()
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

    func setConstraintOnLabel(){
        
        menuCustomization.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        menuCustomization.topAnchor.constraint(equalTo: topAnchor,constant: 0).isActive = true
        menuCustomization.widthAnchor.constraint(equalToConstant: 140).isActive = true
        menuCustomization.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0) .isActive = true
        //menuCustomization.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func changeText() {
        guard let safeData = whatMenuCustom else { return }
        menuCustomization.text = safeData.custom
    }
    
    
}
