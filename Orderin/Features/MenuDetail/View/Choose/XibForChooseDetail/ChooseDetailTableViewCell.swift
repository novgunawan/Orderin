//
//  ChooseDetailTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 03/11/21.
//

import UIKit

class ChooseDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var chooseName: UILabel!
    @IBOutlet weak var checkerUI: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //create identifier XIB
    static let identifier = "cellChooseDetail"
    static func nib() -> UINib{
        return UINib(nibName: "ChooseDetailTableViewCell", bundle: nil)
    }
    
    var object: String? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell() {
        guard let object = object else {return}
        chooseName.text = object
    }
}
