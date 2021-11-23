//
//  OrderedMenu.swift
//  Orderin
//
//  Created by Novi Gunawan on 10/11/21.
//

import Foundation
struct OrderedMenu: Encodable {
    
    let menuID: String
    let foodName: String
    let qty: Int
    let price: Int
    let customization: [String]
    let notes: String?
}

struct ArrayOrderedMenu {
    static var shared = ArrayOrderedMenu()
    var orders: [OrderedMenu] = []
}
