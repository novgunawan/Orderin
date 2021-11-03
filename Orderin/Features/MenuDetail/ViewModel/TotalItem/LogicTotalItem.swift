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
        guard let totalItem = Int(totalItemLabel!.text ?? "1") else {return}
        let sumItem = totalItem + 1
        totalItemLabel!.text = String(sumItem)
        if sumItem > 0{
            minusButton.isEnabled = true
        }
    }
    
    @IBAction func minButtonDidTapped(_ sender: Any) {
        guard let totalItem = Int(totalItemLabel!.text ?? "1") else {return}
        let sumItem = totalItem - 1
        totalItemLabel!.text = String(sumItem)
        if sumItem < 1{
            minusButton.isEnabled = false
        }
    }
    
    
}
