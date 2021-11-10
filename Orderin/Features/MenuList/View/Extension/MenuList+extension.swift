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
        if searchingState == true{
            return 1
        }
        else{
            return data.count
        }
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchingState == true{
            return filteredData.count
        }
        else{
            return data[section].MenuList.count
        }
        
      
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if searchingState == false{
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
        return ""
        
    }
    

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
        
        if searchingState == true{
            return 0
        }
        else{
            return 40.0
        }
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! MenuListTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        
        if searchingState == true{
            let dummy = filteredData[indexPath.row]
            print(indexPath.row)
            cell.dataModel = dummy
            cell.button.tag = indexPath.row
            cell.delegate = self
            cell.button.addTarget(self, action: #selector(didAddButtonTapped), for: .touchUpInside)
            
        }
        else{
            let dummy = data[indexPath.section].MenuList[indexPath.row]
            cell.dataModel = dummy
            cell.button.tag = indexPath.row
            cell.delegate = self
            cell.button.addTarget(self, action: #selector(didAddButtonTapped), for: .touchUpInside)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: show bottom card
        let vc = BottomSheetViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @objc func didAddButtonTapped(){
        let vc = MenuDetailViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
