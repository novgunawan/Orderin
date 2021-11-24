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
    func insertOrderdDataToFireStore(userID: String, tableNumber: Int, model: [OrderedMenu]){
        
        // TODO: Add insert data functionality here!
        
        // generate orderID
        let orderID = Functionality.shared.generateUniqueID()
        var indexData  = 0 // TODO: Change let to var if the looping function is ready!
        
 
        // declare  the path of data
        let path = db.document("users/\(userID)/orders/\(tableNumber)").collection(orderID)
        
        // TODO: Add loop functionality here to  iterate data from model!›
        for data in model{
            
            // store data in the  dictionary format and push data to database
             path.document("item\(indexData)").setData([
                "foodID" : data.menuID,
                "foodName" : data.foodName,
                "qty" : data.qty,
                "customization" : data.customization, // MARK: masih ragu harus dicoba ato fi ganti array of String
                "notes" : (data.notes ?? "You don't have any notes") as String ,
                "price" : data.price,
                
            ])
            indexData += 1
            
        }
      
       
        
    
    }
    
}
