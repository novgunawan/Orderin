//
//  ExtensionOptionalTableView.swift
//  Orderin
//
//  Created by Pieter Yonathan on 01/11/21.
//

import Foundation
import UIKit

extension OptionalTableViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOptionalDetail = optionalTable.dequeueReusableCell(withIdentifier: OptionalDetailTableViewCell.identifier) as! OptionalDetailTableViewCell
        
        // MARK: Insert optional customization from Customization Model to the UI
        cellOptionalDetail.object = object[1].options[indexPath.row]
        
        cellOptionalDetail.priceObject = object[1].prices?[indexPath.row] ?? 0
//        cellOptionalDetail.priceObject = object[1].prices[indexPath.row]
        return cellOptionalDetail
    }
    
    // MARK: Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellOptionalDetail = optionalTable.cellForRow(at: indexPath) as! OptionalDetailTableViewCell
        cellOptionalDetail.checkerUI.image = UIImage(named: "checked")
        
        // MARK: Insert customization that user tap to customizationMenuOrdered Model
//        cellOptionalDetail.customMenuOrderedObject?.options.append(cellOptionalDetail.object ?? "no customization")
        
        // MARK: Insert customization ordered into singletone
        Functionality.shared.tempOptionalCustom.append(cellOptionalDetail.object ?? "no customization")
        Functionality.shared.tempOptionalCustomPrice.append(cellOptionalDetail.priceObject ?? 0)
    }
    
    // MARK: Deselect
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellOptionalDetail = optionalTable.cellForRow(at: indexPath) as! OptionalDetailTableViewCell
        cellOptionalDetail.checkerUI.image = UIImage(named: "unchecked")
        
        // TODO: Novi Validate belom bener
        // MARK: Validate if custommizationMenuOrdered model is not nil, it has to be removed
        if cellOptionalDetail.customMenuOrderedObject?.options != nil {
            cellOptionalDetail.customMenuOrderedObject?.options.removeAll()
        }
    }
    
    //Maximal Option
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let sr = tableView.indexPathsForSelectedRows {
                    if sr.count == 2 { //limit
                        return nil
                    }
                }
                
                return indexPath
    }
}
