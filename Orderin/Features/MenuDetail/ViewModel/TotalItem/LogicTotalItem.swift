//
//  LogicTotalItem.swift
//  Orderin
//
//  Created by Pieter Yonathan on 01/11/21.
//

import Foundation
import UIKit
import Combine

extension TotalItemTableViewCell{
    
    @IBAction func plusButtonDidTapped(_ sender: Any) {
        totalItem += 1
        let stringTotalItems = String (totalItem)
        totalItemLabel!.text = stringTotalItems
        if totalItem > 0{
            minusButton.isEnabled = true
        }
        Functionality.shared.tempQty = totalItem
    }
    
    @IBAction func minButtonDidTapped(_ sender: Any) {
        totalItem -= 1
        let stringSumItem = String(totalItem)
        totalItemLabel!.text = stringSumItem
        if totalItem < 1{
            minusButton.isEnabled = false
        }
        Functionality.shared.tempQty = totalItem
    }
    
}
