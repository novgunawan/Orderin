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
        return 32
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOptionalDetail = optionalTable.dequeueReusableCell(withIdentifier: OptionalDetailTableViewCell.identifier) as! OptionalDetailTableViewCell
        return cellOptionalDetail
    }
    
    //DidSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellOptionalDetail = optionalTable.cellForRow(at: indexPath) as! OptionalDetailTableViewCell
        cellOptionalDetail.checkerUI.image = UIImage(named: "checked")
    }
    
    //DidDeselect
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellOptionalDetail = optionalTable.cellForRow(at: indexPath) as! OptionalDetailTableViewCell
        cellOptionalDetail.checkerUI.image = UIImage(named: "unchecked")
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
