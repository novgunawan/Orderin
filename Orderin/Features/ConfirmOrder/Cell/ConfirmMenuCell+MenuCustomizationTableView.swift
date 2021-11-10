//
//  ConfirmMenuCell+MenuCustomizationTableView.swift
//  Orderin
//
//  Created by Azka Kusuma on 10/11/21.
//

import Foundation
import UIKit

// Menu Customization Cell

extension ConfirmMenuCell: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuCustomizationTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.menuCustomCell) as! MenuCustomizationCell
        
        cell.whatMenuCustom = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    
    
    
    
}
