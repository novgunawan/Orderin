//
//  RestaurantModelDummy.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 10/11/21.
//

import Foundation

struct RestaurantDummy {
    var restoId: String
    var restoEmail: String
    var table: [Table] // TODO: Novi
    var listOfMenu: [MenuListModel]
    
}

struct Table{
    var tableNumber: Int
    var availability: Bool
}
