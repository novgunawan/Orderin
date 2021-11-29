//
//  HomeViewController + AddNewOrderDelegate.swift
//  Orderin
//
//  Created by Azka Kusuma on 29/11/21.
//

import Foundation

extension HomeViewController: addNewMenuFromHomeVCDelegate {
    
    func addOrderFromHome() {
        let menulistVC = MenuListViewController()
        self.navigationController?.pushViewController(menulistVC, animated: true)
    }
    
    
}
