//
//  MenuUIView.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import UIKit

class MenuUIView: UIView {

    // MARK: - View  Components Declaration
    
    // MARK: Top view
    
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "All", at: 0, animated: true)
        segment.insertSegment(withTitle: "Appetizer", at: 1, animated: true)
        segment.insertSegment(withTitle: "Main", at: 2, animated: true)
        segment.insertSegment(withTitle: "Desert", at: 3, animated: true)
        segment.insertSegment(withTitle: "Beverage", at: 4, animated: true)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = .clear
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "dark green")!], for: .selected)
        
       
        return segment
    }()
    
    let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "arrow.up.arrow.down.circle"), for: .bookmark, state: .normal)
        searchController.searchBar.setPositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .bookmark)
        
        return searchController
    }()
    
    // MARK: Table View [Content View]
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.allowsSelection = true
        table.isUserInteractionEnabled  = true
        
        return table
        
    }()

}
