//
//  MenuListModel.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import Foundation
import UIKit

struct Menu{
    var category: Category
    var MenuList: [MenuListModel]
}

struct MenuListModel{
    var menuID: String
    var image: UIImage
    var title: String
    var description: String
    var price: String
    var availability: Bool
}

struct TempMenuList{
    static var shared = TempMenuList()
    var menuModel: MenuListModel?
}


enum Category{
    
    case appetizer
    case main
    case desert
    case beverage
}

