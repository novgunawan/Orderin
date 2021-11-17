//
//  RestaurantModelDummy.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 10/11/21.
//

import Foundation

struct Restaurant {
    var restoId: String
    var restoName: String
    var restoEmail: String
    var table: [TableRestaurants]?
    var listOfMenu: [MenuListModel]?
    
}

