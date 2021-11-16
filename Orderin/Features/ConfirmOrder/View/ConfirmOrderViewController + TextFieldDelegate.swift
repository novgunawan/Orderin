//
//  ConfirmOrderViewController + TextFieldDelegate.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import Foundation
import UIKit

extension ConfirmOrderViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //MARK: Ngambil data dari TextField
        
        textFieldViewModel.textfieldDataToDatabase(textfieldValue: textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }

}
