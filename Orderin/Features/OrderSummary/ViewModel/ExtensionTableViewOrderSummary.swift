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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderSummaryTable.dequeueReusableCell(withIdentifier: OrderIDTableViewCell.identifier) as! OrderIDTableViewCell
                return cell
    }
}
