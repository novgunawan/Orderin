//
//  TestFunction.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 17/11/21.
//

import Foundation
import FirebaseFirestore

struct TestFunction{
    
    static let shared = TestFunction()
    
    // MARK: Insert Fucntion
    func insertOrderdDataToFireStore(userID: String, tableNumber: Int){
        let db = Firestore.firestore()
        // TODO: Add insert data functionality here!
        
        // generate orderID
        let orderID = Functionality.shared.generateUniqueID()
//        var indexData  = 0 // TODO: Change let to var if the looping function is ready!
        
 
        // declare  the path of data
        let path = db.document("users/\(userID)/orders/\(tableNumber)").collection(orderID)
        
        // TODO: Add loop functionality here to  iterate data from model!›
//        for data in model.orderedMenu{
            
            // store data in the  dictionary format and push data to database
            path.document("item\(0)").setData([
                "foodID" : "ajshfjhfhjdhja",
                "foodName" : "Nasi goreng",
                "qty" : 1,
                "customization" : ["tidak pedas", "tanpa sayur"], // MARK: masih ragu harus dicoba ato fi ganti array of String
                "notes" : "minta piringnya 1 mas",
                "price" : 35000,
                
            ])
//            indexData += 1
            
//        }
      
       
        
    
    }
}
