//
//  HomeViewController + AddNewOrderDelegate.swift
//  Orderin
//
//  Created by Azka Kusuma on 29/11/21.
//

import Foundation

// MARK: File ini buat Delegate Add New Menu Button dari Page Order Summary

extension HomeViewController: addNewMenuFromHomeVCDelegate {
    
    func addOrderFromHome() {
        let menulistVC = MenuListViewController()
        self.navigationController?.pushViewController(menulistVC, animated: true)
    }
    
    
}
