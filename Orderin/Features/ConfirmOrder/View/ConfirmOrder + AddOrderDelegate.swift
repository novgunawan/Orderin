//
//  ConfirmOrder + AddOrderDelegate.swift
//  Orderin
//
//  Created by Azka Kusuma on 16/11/21.
//

import Foundation

extension ConfirmOrderViewController: addNewMenuDelegate {
    
    func addOrder() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
