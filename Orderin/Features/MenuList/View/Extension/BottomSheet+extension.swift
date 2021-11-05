//
//  BottomSheet+extension.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 04/11/21.
//

import UIKit
import Foundation

extension BottomSheetViewController : UITableViewDelegate, UITableViewDataSource {
    
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 3
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! FoodItemTableViewCell
          cell.editButton.addTarget(self, action: #selector(didButtonEditTapped), for: .touchUpInside)
          return cell
      }
    
    // MARK: - Logic
    
    @objc func didButtonEditTapped(){
        let vc = MenuDetailViewController()
        self.present(vc, animated: true, completion: nil)
        
        
    }
    



}
