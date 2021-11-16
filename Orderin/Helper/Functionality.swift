//
//  Functionality.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 11/11/21.
//

import Foundation

struct Functionality {
    
    static var shared = Functionality()
    
    // MARK: - Get Timestamp
    func getTimeStamp() -> String {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeStamp = format.string(from: date)
        
        return timeStamp
    }
    
    // MARK: - Generate unique ID
    func generateUniqueID(length: Int = 6) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    
    // MARK: - temporary value holder
    
    // MARK: for table view row and section index
    var sectionIndex = 0
    var rowIndex = 0
    
    
    // MARK: - userDefaults
    
    // add temporary data to userDefault
    func addDataToUserDefault(){
        // TODO: Add functionality to add temporary data in userDefault!
        // TODO: Uncomment the code below, if you already have the data or model of data!
        
//        UserDefaults.standard.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
        
    }
    
    // Delete all data in userdefault after pushing to database!
    func deleteDataInUserDefault(){
        // TODO: Add functionality to delete data in userDefault!
        // TODO: Uncomment the code below, if you already have the data object!
//        UserDefaults.standard.removeObject(forKey: <#T##String#>)
        
    }
    
    // Get all temporary data in userDefaults!
    func getDataFromUserDefaults(){
        // TODO: Add functionality to get data from userDefault!
        
    }
    
    
}
