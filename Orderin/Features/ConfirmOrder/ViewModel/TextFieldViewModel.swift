//
//  TextFieldViewModel.swift
//  Orderin
//
//  Created by Azka Kusuma on 16/11/21.
//

import Foundation


struct TextFieldViewModel {
    
    //MARK: Function ini ambil value dari textfield Notes di Confirm Order. function dipanggil di TextFieldDidEndEditing di File Extension ConfirmOrderViewController 
    
    func textfieldDataToDatabase(textfieldValue: String?) {
        
        print(textfieldValue)
      
    }
}
