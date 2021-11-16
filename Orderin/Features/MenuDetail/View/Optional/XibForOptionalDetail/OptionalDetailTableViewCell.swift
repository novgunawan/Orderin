//
//  OptionalDetailTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class OptionalDetailTableViewCell: UITableViewCell {
 
    @IBOutlet weak var viewCell: UIView!{
        didSet{
            priceLabel.text = "5000"
            if priceLabel.text == " "{
                rpLabel.isHidden = true
                viewCell.frame = CGRect(x: 0, y: 0,width: 342, height: 32)
                optionalNameLabel.frame = CGRect(x: 0, y: 16, width: 264, height: 21)
            }
        }
    }
    
    @IBOutlet weak var rpLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var checkerUI: UIImageView!
  
    @IBOutlet weak var optionalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //create identifier XIB
    static let identifier = "cellOptionalDetail"
    static func nib() -> UINib{
        return UINib(nibName: "OptionalDetailTableViewCell", bundle: nil)
    }
    
    var object: String? {
        didSet {
            setupCell()
        }
    }
    
    var priceObject: Int? {
        didSet {
            setupPrice()
        }
    }
    var customMenuOrderedObject: CustomizationMenuOrdered?
    
    func setupCell() {
        guard let object = object else {return}
        optionalNameLabel.text = object
    }
    
    func setupPrice() {
        var stringPrice = ""
        guard let object = priceObject else {return}
        
        stringPrice = String(object)
        stringPrice.insert(".", at: stringPrice.index(stringPrice.endIndex, offsetBy: -3))
        priceLabel.text = stringPrice
        
    }
}
