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
}

//HARUS DI DISABLE TAP CELLNYA
