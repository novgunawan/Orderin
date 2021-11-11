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
        cellChooseDetail.object = object?.sauceCustom[indexPath.row]
        return cellChooseDetail
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellChooseDetail = chooseTable.cellForRow(at: indexPath) as! ChooseDetailTableViewCell
        cellChooseDetail.checkerUI.image = UIImage(named: "checked")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellChooseDetail = chooseTable.cellForRow(at: indexPath) as! ChooseDetailTableViewCell
        cellChooseDetail.checkerUI.image = UIImage(named: "unchecked")
    }
}
