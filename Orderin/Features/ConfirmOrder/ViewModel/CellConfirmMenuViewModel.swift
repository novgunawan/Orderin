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
        
        // TODO: Backend [create condition if user hasn't ordered any menu and go to confirm order page
        
//        print(ArrayOrderedMenu.shared.orders[0].customization)
        let custom1 = OrderedMenuCustomizationDummyData(custom: "French Fries")
        let custom2 = OrderedMenuCustomizationDummyData(custom: "BBQ Sauce ")
        let custom3 = OrderedMenuCustomizationDummyData(custom: "More Ice")
        let custom4 = OrderedMenuCustomizationDummyData(custom: "Less Sugar")
        
        
        menuCustomData = [custom1, custom2, custom3, custom4]
        
        completion(self.menuCustomData)
        
    }
}
