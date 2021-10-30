//
//  ExtensionMenuDetailViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 29/10/21.
//

import Foundation
import UIKit


extension MenuDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
//MARK: - Setup Cell In Table View

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 160
}


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = detailListTable.dequeueReusableCell(withIdentifier: OptionalTableViewCell.identifier) as! OptionalTableViewCell
    return cell
    }
}

