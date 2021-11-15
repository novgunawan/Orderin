//
//  MenuListViewModel.swift
//  Orderin
//
//  Created by Novi Gunawan on 26/10/21.
//

import Foundation
import UIKit

struct MenuListViewModel {
    
    var menuData: [Menu] = []
    var menuWithoutCategory: [MenuListModel] = []
    
    
    // Fetching data
    mutating func fetchMenuListData(completion: @escaping([Menu])-> Void) {
        
        // TODO: under develop
   
        let data1 = Menu(category: .appetizer, MenuList: [
            MenuListModel(menuID:"XYZ123",image: UIImage(named: "french-fries")!, title: "French Fries", description: "ini kentang enak banget", price: "Rp25.000",availability: true),
            MenuListModel(menuID:"XYZ456",image: UIImage(named: "salad")!, title: "Salad", description: "ini salad enak banget", price: "Rp45.000", availability: true),
            MenuListModel(menuID: "XYZ456",image: UIImage(named: "sausages")!, title: "Sausages", description: "ini sosis enak banget", price: "Rp30.000", availability: true),
           ]
        )
        
        let data2 = Menu(category: .main, MenuList: [
            MenuListModel(menuID:"ABC123",image: UIImage(named: "chiken-katsu")!, title: "Chiken Katsu", description: "ini chiken katsu enak banget", price: "Rp35.000",availability: true),
            MenuListModel(menuID:"ABC353",image: UIImage(named: "fried-rice")!, title: "Fried Rice", description: "ini nasi goreng enak banget", price: "Rp30.000",availability: true),
            MenuListModel(menuID: "ABC389",image: UIImage(named: "pasta")!, title: "Spaghetti", description: "ini spaghetti enak banget", price: "Rp50.000",availability: true),
            MenuListModel(menuID: "ABC837",image: UIImage(named: "steak")!, title: "Steak", description: "ini steakß enak banget", price: "Rp35.000", availability: true)
            ]
        )
        
        let data3 = Menu(category: .desert, MenuList: [
            MenuListModel(menuID:"DEF345",image: UIImage(named: "vanilla-ice-cream")!, title: "Vannila Ice Cream", description: "ini es krim enak banget", price: "Rp25.000", availability: true),
            MenuListModel(menuID:"DEF849",image: UIImage(named: "waffle-ice-cream")!, title: "Waffle", description: "ini waffle enak banget", price: "Rp35.000", availability:true)
            ]
        )
        
        
        let data4 = Menu(category: .beverage, MenuList: [
            MenuListModel(menuID: "JKL849",image: UIImage(named: "coffee-latte")!, title: "Coffee Latte", description: "ini latte enak banget", price: "Rp25.000", availability: true),
            MenuListModel(menuID:"JKL984",image: UIImage(named: "ice-tea")!, title: "Tea", description: "ini teh enak banget", price: "Rp10.000", availability:  true),
            MenuListModel(menuID: "JKL909",image: UIImage(named: "orange-juice")!, title: "Orange Juice", description: "ini jus jeruk enak banget", price: "Rp20.000", availability: true)
            ]
        )
        
      
        
        menuData = [data1,data2,data3,data4]
        completion(self.menuData)
        
        
    }
    
    mutating func fetchMenuWithoutCategory(completion: @escaping ([MenuListModel])->Void){
        
        let data1 =  MenuListModel(menuID:"XYZ123",image: UIImage(named: "french-fries")!, title: "French Fries", description: "ini kentang enak banget", price: "Rp25.000",availability: true)
        
        let data2 =  MenuListModel(menuID:"XYZ456",image: UIImage(named: "salad")!, title: "Salad", description: "ini salad enak banget", price: "Rp45.000", availability: true)
        
        let data3 = MenuListModel(menuID: "XYZ456",image: UIImage(named: "sausages")!, title: "Sausages", description: "ini sosis enak banget", price: "Rp30.000", availability: true)
        
        let data4 =  MenuListModel(menuID:"ABC123",image: UIImage(named: "chiken-katsu")!, title: "Chiken Katsu", description: "ini chiken katsu enak banget", price: "Rp35.000",availability: true)
        
        let data5 =  MenuListModel(menuID:"ABC353",image: UIImage(named: "fried-rice")!, title: "Fried Rice", description: "ini nasi goreng enak banget", price: "Rp30.000",availability: true)
        
        let data6 = MenuListModel(menuID: "ABC389",image: UIImage(named: "pasta")!, title: "Spaghetti", description: "ini spaghetti enak banget", price: "Rp50.000",availability: true)
        
        let data7 =  MenuListModel(menuID: "ABC837",image: UIImage(named: "steak")!, title: "Steak", description: "ini steakß enak banget", price: "Rp35.000", availability: true)
        
        let data8 =  MenuListModel(menuID:"DEF345",image: UIImage(named: "vanilla-ice-cream")!, title: "Vannila Ice Cream", description: "ini es krim enak banget", price: "Rp25.000", availability: true)
        
        let data9 =   MenuListModel(menuID:"DEF849",image: UIImage(named: "waffle-ice-cream")!, title: "Waffle", description: "ini waffle enak banget", price: "Rp35.000", availability:true)
        
        let data10 =  MenuListModel(menuID: "JKL849",image: UIImage(named: "coffee-latte")!, title: "Coffee Latte", description: "ini latte enak banget", price: "Rp25.000", availability: true)
            
        let data11 = MenuListModel(menuID:"JKL984",image: UIImage(named: "ice-tea")!, title: "Tea", description: "ini teh enak banget", price: "Rp10.000", availability:  true)
        
        let data12 = MenuListModel(menuID: "JKL909",image: UIImage(named: "orange-juice")!, title: "Orange Juice", description: "ini jus jeruk enak banget", price: "Rp20.000", availability: true)
        
      
        
        menuWithoutCategory = [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12]
        completion(self.menuWithoutCategory)
        
        
    }
    
    
}
