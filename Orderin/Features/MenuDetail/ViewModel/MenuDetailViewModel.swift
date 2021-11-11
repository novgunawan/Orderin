//
//  AssignDataMenuDetail.swift
//  Orderin
//
//  Created by Pieter Yonathan on 04/11/21.
//

import Foundation

struct MenuDetailViewModel {
    var custom: [Customization] = []
    
    mutating func assignDataCustomization(completion: @escaping([Customization])-> Void) {
        custom = customizationData
        completion(self.custom)
    }
}
