//
//  DataManipulation.swift
//  Orderin
//
//  Created by Novi Gunawan on 10/11/21.
//

import Foundation
import FirebaseFirestore

class DataManipulation {
    
    // MARK: Singletone
    static let shared = DataManipulation()
    
    // MARK: Connection to Firebase
    
    var ref: DocumentReference? = nil
    var db = Firestore.firestore()
    
    
    func insertUser(with user: Users) {
        ref = db.collection("users").addDocument(data: [
            "name": "\(user.displayName)",
            "email": "\(user.email)",
        ]) { error in
            if let error = error {
                print("Error adding document \(error)")
            } else {
                print("Document added with ID : \(self.ref!.documentID)")
                UserDefaults.standard.setValue(self.ref!.documentID, forKey: "userId")
            }
        }
    }
    
  

}
