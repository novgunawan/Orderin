//
//  ConfirmOrderViewModel.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 15/11/21.
//

import Foundation
import FirebaseFirestore

struct ConfirmOrderViewModel{
    
    // MARK: - Variables Declaration
    let db = Firestore.firestore()
    
    
    
    // MARK: - Database Function
    
    // MARK: Insert Fucntion
    func insertOrderdDataToFireStore(userID: String, tableNumber: Int){
        
        // TODO: Add insert data functionality here!
        
        // generate orderID
        let orderID = Functionality.shared.generateUniqueID()
        let indexData  = 0 // TODO: Change let to var if the looping function is ready!
        
 
        // declare  the path of data
        let path = db.document("users/\(userID)/orders/\(tableNumber)").collection(orderID).document("item\(indexData)")
        
        // store data in the  dictionary format and push data to database
        path.setData([
            "foodName" : "placeholder food name",
            "qty" : "placeholder for food qty , it will be Integer",
            "customization" : "placholder for customization in menu, it wil be array of String | [String]",
            "notes" : "placholder for food oreder notes, it will be String",
            "price" : "placeholder for  food price , it will be Integer",
            
        ])
        
    
    }
    
}
