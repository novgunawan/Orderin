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
        return 6
    }
    
    //Content Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1{
            let cellOrderID = orderSummaryTable.dequeueReusableCell(withIdentifier: OrderIDTableViewCell.identifier) as! OrderIDTableViewCell
            return cellOrderID
        }
        if indexPath.row < 5{
            let cellOrderSummary = orderSummaryTable.dequeueReusableCell(withIdentifier: OrderSummaryTableViewCell.identifier) as! OrderSummaryTableViewCell
            return cellOrderSummary
        }
        let cellNotesSummaryOrder = orderSummaryTable.dequeueReusableCell(withIdentifier: NotesSummaryOrderTableViewCell.identifier) as! NotesSummaryOrderTableViewCell
        return cellNotesSummaryOrder
    }
}
