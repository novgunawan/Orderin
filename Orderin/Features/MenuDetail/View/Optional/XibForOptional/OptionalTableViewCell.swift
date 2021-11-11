//
//  OptionalTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 28/10/21.
//

import UIKit

class OptionalTableViewCell: UITableViewCell{

    @IBOutlet weak var optionalTable: UITableView!{
        didSet{
            optionalTable.frame.size.height = (32 * CGFloat(self.object?.sideDishCustom.count ?? 3))//count of cell
        }
    }
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var optionalTitleLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!{
        didSet{
            //height view
            viewCell.frame.size.height = 55 + (32 * CGFloat(self.object?.sideDishCustom.count ?? 3))//count of cell
            //corner radius
            viewCell.layer.cornerRadius = 5
            //shadow
            viewCell.layer.shadowColor = UIColor.black.cgColor
            viewCell.layer.shadowOpacity = 0.1
            viewCell.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
            viewCell.layer.shadowRadius = 4
        }
    }
    //register XIB
    static let identifier = "cell"
    static func nib() -> UINib{
        return UINib(nibName: "OptionalTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        optionalTable.register(OptionalDetailTableViewCell.nib(), forCellReuseIdentifier: OptionalDetailTableViewCell.identifier)
        
        optionalTable.delegate = self
        optionalTable.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    var object: Customization?
}
