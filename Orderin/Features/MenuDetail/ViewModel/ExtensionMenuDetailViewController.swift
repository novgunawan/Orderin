//
//  ExtensionMenuDetailViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 29/10/21.
//

import Foundation
import UIKit


extension MenuDetailViewController: UITableViewDelegate, UITableViewDataSource, SaveOrderedMenuDelegate{
    
    func saveOrderedMenu() {
        
        
        // MARK: Set customization to user defaults
        
        let tempChooseCustom = Functionality.shared.tempChooseCustom
        
        let tempOptionalCustom = Functionality.shared.tempOptionalCustom
        
        let tempOptionalCustomPrice = Functionality.shared.tempOptionalCustomPrice
        
        let tempNotes = Functionality.shared.tempNotes
        
        let tempQuantity = Functionality.shared.tempQty
        
        let totalOptionalPrice = tempOptionalCustomPrice.reduce(0, +)
        
        // MARK: Combine choose and optional into one array of string
        var tempCustomization = [tempChooseCustom]
        tempCustomization.append(contentsOf: tempOptionalCustom)

        ArrayOrderedMenu.shared.orders.append(OrderedMenu(menuID: menuID, foodName: menuName, qty: tempQuantity, price: Int(menuPrice) ?? 0, customization: tempCustomization, notes: tempNotes))

        print(ArrayOrderedMenu.shared.orders)
        
//        Functionality.shared.setDataToUserDefault(data: tempChooseCustom, key: C.UserDefaultKey.keyChooseCustomization)
//
//        Functionality.shared.setDataToUserDefault(data: tempOptionalCustom, key: C.UserDefaultKey.keyOptionalCustomization)
//
//        Functionality.shared.setDataToUserDefault(data: tempOptionalCustomPrice, key: C.UserDefaultKey.keyOptionalCustomizationPrice)
        
        
    }
    
//MARK: - Setup Cell In Table View

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // MARK: Choose Table View Cell
    if indexPath.row < 1{
        let HeightCell = 80 + (53 * CGFloat(customization[0].options.count) )//count of cell
        return CGFloat(HeightCell)
    }
    // MARK: Optional Table View Cell
    if indexPath.row < 2{
        let HeightCell = 90 + (55 * CGFloat(customization[1].options.count))//count of cell
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
    
    cellCartButton.delegate = self
    //TODO: Make a clear for flow
    cellCartButton.cartButton.addTarget(self, action: #selector(didButtonCartTapped), for: .touchUpInside)
    return cellCartButton
    }
    
    //TODO: Dismiss modal and passing data
    @objc func didButtonCartTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}

