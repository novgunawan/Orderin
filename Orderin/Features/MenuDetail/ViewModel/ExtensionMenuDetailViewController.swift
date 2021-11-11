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
    if indexPath.row < 1{
        let HeightCell = 75 + (32 * 3)//count of cell
        return CGFloat(HeightCell)
    }
    if indexPath.row < 2{
        let HeightCell = 75 + (32 * 3)//count of cell
        return CGFloat(HeightCell)
    }
    if indexPath.row < 3{
        return 43
    }
    if indexPath.row < 4{
        return 68
    }
    if indexPath.row < 5{
        return 88
    }
    return 148
}


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row < 1{
    let cellChoose = detailListTable.dequeueReusableCell(withIdentifier: ChooseTableViewCell.identifier) as! ChooseTableViewCell
        
        cellChoose.object = customization
            return cellChoose
        }
    if indexPath.row < 2{
    let cell = detailListTable.dequeueReusableCell(withIdentifier: OptionalTableViewCell.identifier) as! OptionalTableViewCell
        cell.object = customization
        return cell
        }
    if indexPath.row < 3{
        let cellNotes = detailListTable.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier) as! NotesTableViewCell
        return cellNotes
    }
    if indexPath.row < 4{
        let cellTotalItem = detailListTable.dequeueReusableCell(withIdentifier: TotalItemTableViewCell.identifier) as! TotalItemTableViewCell
        return cellTotalItem
    }
    let cellCartButton = detailListTable.dequeueReusableCell(withIdentifier: CartButtonTableViewCell.identifier) as! CartButtonTableViewCell
    cellCartButton.cartButton.addTarget(self, action: #selector(didButtonCartTapped), for: .touchUpInside)
    return cellCartButton
    }
    
    //present order summary
    @objc func didButtonCartTapped(){
        let vc = OrderSummaryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
