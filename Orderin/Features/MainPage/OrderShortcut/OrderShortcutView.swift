//
//  OrderShortcut.swift
//  Orderin
//
//  Created by Novi Gunawan on 04/11/21.
//

import UIKit

class OrderShortcutView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeTitle1)
        return label
    }()
    
    var instructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.textColor = C.hexStringToUIColor(hex: C.gray70)
        return label
    }()
    
    var tableNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "12"
        return label
    }()

}
