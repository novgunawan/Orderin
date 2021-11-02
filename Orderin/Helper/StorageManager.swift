//
//  StorageManager.swift
//  Orderin
//
//  Created by Novi Gunawan on 02/11/21.
//

import Foundation
class StorageManager {
    enum Key: String {
        case isNewUser
    }
    static var shared = StorageManager()
    func isNewUser() -> Bool {
        UserDefaults.standard.bool(forKey: Key.isNewUser.rawValue )
    }

    func setNewUser() {
        UserDefaults.standard.set(true, forKey: Key.isNewUser.rawValue)
    }

    func setExistingUser() {
        UserDefaults.standard.set(false, forKey: Key.isNewUser.rawValue)
    }
}
