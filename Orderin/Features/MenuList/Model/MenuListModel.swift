//
//  MenuListModel.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import Foundation
import UIKit

struct MenuListModel{
    var image: UIImage
    var title: String
    var description: String
    var price: String
    var category: Category
}


enum Category{
    case appetizer
    case main
    case desert
    case beverage
}
