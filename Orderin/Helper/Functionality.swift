//
//  Functionality.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 11/11/21.
//

import Foundation

class Functionality {
    
    //MARK: - Get Timestamp
    func getTimeStamp() -> String {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeStamp = format.string(from: date)
        
        return timeStamp
    }
    
    
}
