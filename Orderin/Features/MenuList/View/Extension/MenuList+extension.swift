//
//  MenuList+extension.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import Foundation
import UIKit

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource, CellDelegate {
    
    func buttonTapped(tag: Int) {
        // TODO: Show Menu detail based on index data
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // under develop
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! MenuListTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        let dummy = data[indexPath.row]
        cell.setContent(dummy: dummy)
        cell.button.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: show bottom card
    }
    
    
}
