//
//  ConfirmMenuCell+MenuCustomizationTableView.swift
//  Orderin
//
//  Created by Azka Kusuma on 10/11/21.
//

import Foundation
import UIKit

protocol editButtonDelegate {
    func editButtonDidTap()
}

// Menu Customization Cell

extension ConfirmMenuCell: UITableViewDelegate, UITableViewDataSource{
    
    // TODO: Auto Layout TextField
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case data.count :
            
            let editCell = menuCustomizationTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.editButtonCell) as! EditButtonCell
            editCell.editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
            
            return editCell
            
        default:
            
            let cell = menuCustomizationTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.menuCustomCell) as! MenuCustomizationCell
            cell.whatMenuCustom = data[indexPath.row]
            
            return cell
        }
      
    }
    // TODO: Line TextField
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    
    @objc func editButtonDidTap() {
        print("edit pressed")
        delegate?.editButtonDidTap()
        
    }
    
    
    
}
