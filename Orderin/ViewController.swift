//
//  ViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func cancelOrder() {
        
        let button = UIButton()
         button.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
         button.backgroundColor = UIColor.red
         button.setTitle("Name your Button ", for: .normal)
         button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
         self.view.addSubview(button)

   
    }
    
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
    }
}
