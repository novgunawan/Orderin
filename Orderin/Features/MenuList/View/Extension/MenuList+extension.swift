//
//  MenuList+extension.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import Foundation
import UIKit

// MARK: - Search Functionality

extension MenuListViewController:  UISearchResultsUpdating, UISearchBarDelegate {
        
    func filterCurrentData(searchText: String){
        
       filteredData = dataWithoutCategory.filter({ menu in
           
           return menu.title.lowercased().contains(searchText.lowercased())
        })
        
        searchingState  = true
        
    }


    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text{
            if searchText.count > 0{
                self.filterCurrentData(searchText: searchText)
                menuListView.segmentedControl.isHidden = true
            }
            else{
                searchingState = false
                menuListView.segmentedControl.isHidden = false
            }
        }
        menuListView.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchingState = false
        filteredData.removeAll()
        menuListView.tableView.reloadData()
        menuListView.segmentedControl.isHidden = false
    }
    
    //dismiss keyboard when scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        menuListView.searchController.searchBar.endEditing(true)    }
    
    //dismiss keyboard when tap in outside keyboard
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:self, action:    #selector(MenuListViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        menuListView.searchController.searchBar.endEditing(true)
    }
}

// MARK: - Table View Functionality

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource, CellDelegate {
   
    
  
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
                        
        }
        else{
            let dummy = data[indexPath.section].MenuList[indexPath.row]
            cell.indexSection = indexPath.section
            cell.indexRow = indexPath.row
            cell.dataModel = dummy
            cell.button.tag = indexPath.row
            cell.delegate = self
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
    
    func buttonTapped(tag: Int, sectionIndex: Int, rowIndex rowIndes: Int) {
      
        let vc = MenuDetailViewController()
        vc.dataObject = data[sectionIndex].MenuList[rowIndes]
        self.present(vc, animated: true, completion: nil)
     
    }
}
