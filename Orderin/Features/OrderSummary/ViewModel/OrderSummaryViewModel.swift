//
//  OrderSummaryViewModel.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 15/11/21.
//

import Foundation
import FirebaseFirestore

struct OrderSummaryViewModel{
    
    var orderModel: [OrderModel] = []
    let db = Firestore.firestore()
    
    func fetchDataOrderFromFireStoreDatabase(userID: String, orderID: String,tableNumber: Int, model: OrderModel){
        
        // TODO: add fetch odrder functionality here !
        
        let path = db.document("users/\(userID)/orders/\(tableNumber)").collection(orderID)
        
        path.getDocuments { querySnapshot, error in
            if let err = error{
                print("Error when getting documents: \(err)")
            }
            else{
                guard let query = querySnapshot else { return  }
                for doc in query.documents{
                    // TODO: Append data in array of model
                    print(doc)
                }
            }
        }
        
    }
}
