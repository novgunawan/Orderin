//
//  ExtensionOrderSummaryDetailTable.swift
//  Orderin
//
//  Created by Pieter Yonathan on 10/11/21.
//

import Foundation
import UIKit

extension OrderSummaryTableViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 2{
        let cellOrderSummaryDetail = orderSummaryDetailTable.dequeueReusableCell(withIdentifier: OrderSummaryDetailTableViewCell.identifier) as! OrderSummaryDetailTableViewCell
        return cellOrderSummaryDetail
        }
        let cellNoteMenu = orderSummaryDetailTable.dequeueReusableCell(withIdentifier: NoteforMenuTableViewCell.identifier) as! NoteforMenuTableViewCell
        return cellNoteMenu
    }
}
