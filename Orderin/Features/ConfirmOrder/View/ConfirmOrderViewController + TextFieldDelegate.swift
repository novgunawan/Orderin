//
//  ConfirmOrderViewController + TextFieldDelegate.swift
//  Orderin
//
//  Created by Azka Kusuma on 11/11/21.
//

import Foundation
import UIKit

extension ConfirmOrderViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let txtFieldPosition = textField.convert(textField.bounds.origin, to: confirmMenuTableView)
        let indexPath = confirmMenuTableView.indexPathForRow(at: txtFieldPosition)
        if indexPath != nil {
            confirmMenuTableView.scrollToRow(at: indexPath!, at: .top, animated: true)
        }
        return true
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action:    #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
    
    
}
