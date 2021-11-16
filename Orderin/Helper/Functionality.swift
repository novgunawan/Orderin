//
//  Functionality.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 11/11/21.
//

import Foundation

class Functionality {
    
    static var shared = Functionality()
    
    // MARK: -Value Holder Temporary
    
    // Must Choose Customization
    var tempChooseCustom: String = ""
    
    // Optional Choose Customization
    var tempOptionalCustom: [String] = []
    // Optional Choose Customization Price
    var tempOptionalCustomPrice: [Int] = []
    
    
    // MARK: -Functions
    
    // MARK: Get Timestamp
    func getTimeStamp() -> String {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeStamp = format.string(from: date)
        
        return timeStamp
    }
    
    // MARK: Set Data to User Default
    
    func setDataToUserDefault(data: Any, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: key)
    }
}
