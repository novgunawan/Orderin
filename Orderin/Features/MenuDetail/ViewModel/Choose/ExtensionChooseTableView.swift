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
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOptionalDetail = chooseTable.dequeueReusableCell(withIdentifier: OptionalDetailTableViewCell.identifier) as! OptionalDetailTableViewCell
        return cellOptionalDetail
    }
}
