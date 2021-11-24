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
//        let controllers = self.navigationController?.viewControllers
//                for vc in controllers! {
//                    if vc is MenuListViewController {
//                        _ = self.navigationController?.popToViewController(vc as! MenuListViewController, animated: true)
//                                }
//                             }
//        self.dismiss(animated: true, completion: nil)
    }
    
    func dropButtonNav(){
        navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    
}
