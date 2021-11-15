//
//  CellConfirmMenuViewModel.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import Foundation
import UIKit

struct CellConfirmationViewModel {
    
    var menuCustomData: [OrderedMenuCustomizationDummyData] = []
    
    // Fetching data dummy
    
    mutating func fetchMenuCustomization(completion: @escaping([OrderedMenuCustomizationDummyData]) -> Void) {
        
        let custom1 = OrderedMenuCustomizationDummyData(custom: "French Fries")
        let custom2 = OrderedMenuCustomizationDummyData(custom: "BBQ Sauce ")
        let custom3 = OrderedMenuCustomizationDummyData(custom: "More Ice")
        let custom4 = OrderedMenuCustomizationDummyData(custom: "Less Sugar")
        
        menuCustomData = [custom1, custom2]
        
        completion(self.menuCustomData)
    }
}
