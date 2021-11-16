//
//  ChooseTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 30/10/21.
//

import UIKit

class ChooseTableViewCell: UITableViewCell{


    // TODO: Count of cell belum bisa dibuat dynamic
    @IBOutlet weak var chooseLabel: UILabel! {
        didSet {
            chooseLabel.text = "Spiciness"
        }
    }
    @IBOutlet weak var chooseTable: UITableView! {
        didSet{
            chooseTable.frame.size.height = (53 * 2)//count of cell
        }
    }
    
    @IBOutlet weak var viewCell: UIView!
        {
            didSet{
                //height view
                viewCell.frame.size.height = 55 + (53 * 2)//count of cell
                //corner radius
                viewCell.layer.cornerRadius = 5
                //shadow
                viewCell.layer.shadowColor = UIColor.black.cgColor
                viewCell.layer.shadowOpacity = 0.1
                viewCell.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
                viewCell.layer.shadowRadius = 4
            }
        }
    //create identifier XIB
    static let identifier = "cellChoose"
    static func nib() -> UINib{
        return UINib(nibName: "ChooseTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chooseTable.register(ChooseDetailTableViewCell.nib(), forCellReuseIdentifier: ChooseDetailTableViewCell.identifier)
        
        chooseTable.delegate = self
        chooseTable.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var object: [Customization] = []
    
}

