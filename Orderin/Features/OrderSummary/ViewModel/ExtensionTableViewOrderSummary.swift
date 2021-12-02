//
//  ExtensionTableViewOrderSummary.swift
//  Orderin
//
//  Created by Pieter Yonathan on 09/11/21.
//

import Foundation
import UIKit

extension OrderSummaryViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - Setup Cell in Table View
    
    //TODO: Logic for number of row
    //TODO: get data in database for number of row
    
    //Height Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 1{
            return 125
        }
        if indexPath.row < 5{
            let HeightCell = 68 + (20 * 4)//count of cell
            return CGFloat(HeightCell)
        }
        return 43
    }
    
    //Number of Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var orderedMenu = ArrayOrderedMenu.shared.orders
        return orderedMenu.count + 2
    }
    
    //Content Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 1{
            let cellOrderID = orderSummaryTable.dequeueReusableCell(withIdentifier: OrderIDTableViewCell.identifier) as! OrderIDTableViewCell
            return cellOrderID
        }
        if indexPath.row < orderedMenu.count + 1{
            let cellOrderSummary = orderSummaryTable.dequeueReusableCell(withIdentifier: OrderSummaryTableViewCell.identifier) as! OrderSummaryTableViewCell
            cellOrderSummary.nameMenuLabel.text = orderedMenu[indexPath.row-1].foodName
            return cellOrderSummary
        }
        let cellNotesSummaryOrder = orderSummaryTable.dequeueReusableCell(withIdentifier: NotesSummaryOrderTableViewCell.identifier) as! NotesSummaryOrderTableViewCell
        return cellNotesSummaryOrder
    }
}
