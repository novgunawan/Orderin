//
//  OrderSummary.swift
//  Orderin
//
//  Created by Azka Kusuma on 01/11/21.
//

import UIKit

class OrderSummary: UIViewController {
    
       let topLabel: UILabel = {
           
           let label = UILabel(frame: CGRect(x: 57, y: 94, width: 276, height: 72))
           label.numberOfLines = 2
           label.textAlignment = .center
           
           label.font = UIFont(name: Constant.CancelOrder.fontName, size: 20)
           label.text = "SUMMARY BROW"
           
           return label
           
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(topLabel)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
