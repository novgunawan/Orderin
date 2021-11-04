//
//  MenuListViewModel.swift
//  Orderin
//
//  Created by Novi Gunawan on 26/10/21.
//

import Foundation
import UIKit

struct MenuListViewModel {
    
    var menuData : [Menu] = []
    
    
    // Fetching data
    mutating func fetchMenuListData(completion: @escaping([Menu])-> Void) {
        
        // TODO: under develop
   
        let data1 = Menu(category: .appetizer, MenuList: [MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"),MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000")])
        
        let data2 = Menu(category: .main, MenuList: [MenuListModel(image: UIImage(named: "food-dummy")!, title: "Nasi Goreng", description: "ini nasi goreng enak banget", price: "Rp30.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"),MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000")])
        
        let data3 = Menu(category: .desert, MenuList: [MenuListModel(image: UIImage(named: "food-dummy")!, title: "Puding", description: "ini puding enak banget", price: "Rp45.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"),MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000")])
        
        
        let data4 = Menu(category: .beverage, MenuList: [MenuListModel(image: UIImage(named: "food-dummy")!, title: "Jus Jeruk", description: "ini jus jeruk enak banget", price: "Rp25.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"),MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000"), MenuListModel(image: UIImage(named: "food-dummy")!, title: "Burger", description: "ini burger enak banget", price: "Rp35.000")])
        
      
        
        menuData = [data1,data2,data3,data4]
        completion(self.menuData)
        
        
    }
    
    
}
