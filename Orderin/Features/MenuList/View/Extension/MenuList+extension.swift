//
//  MenuList+extension.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import Foundation
import UIKit

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource, CellDelegate {
  
    
    func buttonTapped(tag: Int) {
        // TODO: Show Menu detail based on index data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].MenuList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Appetizer"
        case 1:
            return "Main"
        case 2:
            return "Desert"
        case 3:
            return "Beverage"
        default:
            return nil
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myLabel = UILabel()
//        myLabel.frame = CGRect(x:16, y: 8, width: 320, height: 20)
//        myLabel.font = UIFont(name: C.fontPoppinsSemibold, size: 32.0)
//        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
//
//        let headerView = UIView()
//        headerView.addSubview(myLabel)
//        headerView.frame = CGRect(x: 0, y: 0, width: 320, height: 50.0)
//        headerView.backgroundColor = .white
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50.0
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .white
        
        let sectionTitle = UILabel(frame: CGRect(x: 16.0, y: 0, width: view.frame.width - 15, height: 40.0))
        sectionTitle.text = self.tableView(tableView, titleForHeaderInSection: section)
        sectionTitle.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeTitle)
        view.addSubview(sectionTitle)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! MenuListTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        let dummy = data[indexPath.section].MenuList[indexPath.row]
        cell.dataModel = dummy
        cell.button.tag = indexPath.row
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: show bottom card
        let vc = BottomSheetViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
