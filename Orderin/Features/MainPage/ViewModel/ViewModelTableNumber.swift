//
//  ViewModelTableNumber.swift
//  Orderin
//
//  Created by Azka Kusuma on 24/11/21.
//

import Foundation

class TableNumber {
    
    private init() {}
    static var tableNumber = ""
    
    static func fetchTableNumber() -> String {
        return tableNumber
    }
    
}
