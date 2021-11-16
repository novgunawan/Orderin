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
    func insertOrderdDataToFireStore(userID: String, tableNumber: Int, model: OrderModel){
        
        // TODO: Add insert data functionality here!
        
        // generate orderID
        let orderID = Functionality.shared.generateUniqueID()
        var indexData  = 0 // TODO: Change let to var if the looping function is ready!
        
 
        // declare  the path of data
        let path = db.document("users/\(userID)/orders/\(tableNumber)").collection(orderID)
        
        // TODO: Add loop functionality here to  iterate data from model!
        for data in model.orderedMenu{
            path.document("item\(indexData)").setData([
                "foodID" : data.menuID,
                "foodName" : data.foodName,
                "qty" : data.qty,
                "customization" : data.customization,
                "notes" : "placholder for food oreder notes, it will be String",
                "price" : data.price,
                
            ])
            indexData += 1
            
        }
        // store data in the  dictionary format and push data to database
       
        
    
    }
    
}
