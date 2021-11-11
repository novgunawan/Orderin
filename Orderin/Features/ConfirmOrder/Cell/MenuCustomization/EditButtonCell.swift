//
//  EditButtonCell.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import UIKit

class EditButtonCell: UITableViewCell {
    
    let editButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Edit"
        label.textColor = .red
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeFootnote)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(editButton)
        editButtonConstraint()
        addTapRecognizer()
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
    
    func addTapRecognizer() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editButtonDidTap))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func editButtonDidTap() {
        print("editButton Tap")
        
    }

}
