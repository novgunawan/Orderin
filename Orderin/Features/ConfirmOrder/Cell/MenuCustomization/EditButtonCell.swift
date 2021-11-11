//
//  EditButtonCell.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import UIKit



class EditButtonCell: UITableViewCell {
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: 17)
        button.frame = CGRect(x: -50, y: 0, width: 140, height: 20)
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(editButton)
        //editButtonConstraint()
        
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
 
    func editButtonConstraint() {
        editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        editButton.topAnchor.constraint(equalTo: topAnchor,constant: 0).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        editButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0) .isActive = true
    }
    
}
