//
//  ExtensionChooseTableView.swift
//  Orderin
//
//  Created by Pieter Yonathan on 02/11/21.
//

import Foundation
import UIKit

extension ChooseTableViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChooseDetail = chooseTable.dequeueReusableCell(withIdentifier: ChooseDetailTableViewCell.identifier) as! ChooseDetailTableViewCell
        // MARK: Insert mandatory customization from Customization Model to the UI
        cellChooseDetail.object = object[0].options[indexPath.row]
        return cellChooseDetail
    }
    
    // MARK: Select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cellChooseDetail = chooseTable.cellForRow(at: indexPath) as! ChooseDetailTableViewCell
        cellChooseDetail.checkerUI.image = UIImage(named: "checked")
        
        // MARK: Insert customization that user tap to customizationMenuOrdered Model
//        cellChooseDetail.customMenuOrderedObject?.options.append(cellChooseDetail.object ?? "no customization")
        Functionality.shared.tempChooseCustom = cellChooseDetail.object ?? ""
        //        print(cellChooseDetail.object)
    }
    // MARK: Deselect cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellChooseDetail = chooseTable.cellForRow(at: indexPath) as! ChooseDetailTableViewCell
        cellChooseDetail.checkerUI.image = UIImage(named: "unchecked")
        
        // TODO: Novi Validate belom bener
        // MARK: Validate if custommizationMenuOrdered model is not nil, it has to be removed
        if cellChooseDetail.customMenuOrderedObject?.options != nil {
            cellChooseDetail.customMenuOrderedObject?.options.removeAll()
        }
    }
}
