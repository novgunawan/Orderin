//
//  Functionality.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 11/11/21.
//

import Foundation

struct Functionality {
    
    static var shared = Functionality()
    
    // MARK: -Value Holder Temporary
    
    var tempQty: Int = 1
    // Must Choose Customization
    var tempChooseCustom: String = ""
    var tempNotes: String = ""
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
    // MARK: - userDefaults
    
    // Delete all data in userdefault after pushing to database!
    func deleteDataInUserDefault(key: String){
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func setDataToUserDefault(data: Any, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: key)
    }
    
    func setOrderedMenuToUserDefault(data: AnyObject, key: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: key)
//        do {
//            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
//            defaults.set(encodedData, forKey: key)
//        }
//        catch let error as NSError
//        {
//            print(error.localizedDescription)
//        }
        
    }
    
    func getOrderedMenuFromUserDefault(key: String){
        let defaults = UserDefaults.standard
        
        do {
            let decoded = defaults.object(forKey: key) as! Data
            let decodedTeams = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! ArrayOrderedMenu
            print(decodedTeams.orders)
            
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
    }
}



extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
