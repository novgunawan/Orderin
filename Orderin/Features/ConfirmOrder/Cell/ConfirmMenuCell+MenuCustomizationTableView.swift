//
//  ConfirmMenuCell+MenuCustomizationTableView.swift
//  Orderin
//
//  Created by Azka Kusuma on 10/11/21.
//

import Foundation
import UIKit

extension ConfirmMenuCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuCustomizationTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.menuCustomCell) as! MenuCustomizationCell
        cell.backgroundColor = .red
        return cell
    }
    
    
    
    
}
