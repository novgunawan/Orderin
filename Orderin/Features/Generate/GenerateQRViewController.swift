//
//  GenerateQRViewController.swift
//  Orderin
//
//  Created by Pieter Yonathan on 05/11/21.
//

import UIKit

class GenerateQRViewController: UIViewController {

    @IBOutlet weak var restoID: UITextField!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var tableNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard manage

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.dismissKeyboard()
        // Do any additional setup after loading the view.
    }
    @IBAction func generateAction(_ sender: Any) {
        let tableNumberID = tableNumber.text
        let restaurantID = restoID.text
        if let noTable = tableNumberID, let idResto = restaurantID{
            let combinedString = "Table Number: \(noTable) \nRestaurant ID: \(idResto)"
            qrImage.image = generateQRCode(Name: combinedString)
        }
    }
    
    func generateQRCode(Name: String) -> UIImage?{
        let name_data = Name.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name:"CIQRCodeGenerator"){
            filter.setValue(name_data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
}
