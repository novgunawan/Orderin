//
//  MenuListTableViewCell.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import UIKit

protocol CellDelegate {
    
    func buttonTapped(tag: Int)
}


class MenuListTableViewCell: UITableViewCell {
    
    // MARK: - Components Declaration
    
    var dataModel: MenuListModel?{
        didSet{
            setContent()
        }
    }
    
    var delegate: CellDelegate?
    
    let card: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13.0
        view.backgroundColor = UIColor(named: "white")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    var image: UIImageView = {
       var image = UIImageView()
        image.layer.cornerRadius = 13.0
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.textColor = C.hexStringToUIColor(hex: C.blackOlive)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius =  13.0
        button.backgroundColor = C.hexStringToUIColor(hex: C.red50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        button.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        
        return button
    }()
    

    // MARK: Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(card)
        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(button)
        
        setImageConstraint()
        setTitleLabelConstraints()
        setCardConstraint()
        setDescriptionConstraint()
        setPriceConstraint()
        setButtonConstraint()
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

    // MARK: - Auto Layout
    
    func setImageConstraint(){
        
        image.topAnchor.constraint(equalTo: card.topAnchor, constant: 13.35).isActive = true
        image.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24.65).isActive = true
        image.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 9.0).isActive = true
        image.widthAnchor.constraint(equalToConstant: 88.0).isActive = true
    }
    
    func setTitleLabelConstraints(){
        
        titleLabel.topAnchor.constraint(equalTo: card.topAnchor,constant: 16.85).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10.0).isActive =  true
        titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -9.0).isActive = true
    }
    
    func setDescriptionConstraint(){
    
        descriptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10.0).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3.0).isActive = true
    }
    
    
    func setCardConstraint(){
        
        card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        card.topAnchor.constraint(equalTo: topAnchor,constant: 16.0).isActive = true
        card.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16.0).isActive = true
        card.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -16.0).isActive = true
    }
    
    func setPriceConstraint(){
        
        priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10.0).isActive = true
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 3.0).isActive = true
    }
    
    func setButtonConstraint(){
        
        button.centerYAnchor.constraint(equalTo: card.centerYAnchor).isActive =  true
        button.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -9.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 38.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 75.0).isActive  = true
    }
    
    // MARK: - Logic
    
    @objc func didButtonTapped(_ sender: UIButton){
        delegate?.buttonTapped(tag: sender.tag)
    }
                
    func setContent(){
        
        guard let data = dataModel else { return  }
        
        image.image = data.image
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        priceLabel.text = data.price
    }
    
}
