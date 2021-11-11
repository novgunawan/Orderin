//
//  CellConfirmMenuViewModel.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import Foundation
import UIKit

struct CellConfirmationViewModel {
    
    var menuCustomData: [MenuCustomizationDummyData] = []
    
    // Fetching data dummy
    
    mutating func fetchMenuCustomization(completion: @escaping([MenuCustomizationDummyData]) -> Void) {
        
        let custom1 = MenuCustomizationDummyData(custom: "French Fries")
        let custom2 = MenuCustomizationDummyData(custom: "BBQ Sauce ")
        let custom3 = MenuCustomizationDummyData(custom: "More Ice")
        let custom4 = MenuCustomizationDummyData(custom: "Less Sugar")
        
        menuCustomData = [custom1, custom2, custom3, custom4]
        
        completion(self.menuCustomData)
    }
}
