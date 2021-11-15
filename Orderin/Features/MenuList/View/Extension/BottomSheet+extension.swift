//
//  BottomSheet+extension.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 04/11/21.
//

import UIKit
import Foundation

extension BottomSheetViewController : UITableViewDelegate, UITableViewDataSource, EditbuttonDelegate {

    
    
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          //TODO: Fetch data.count from user default/ temp order user
          // uncomment this function if data.count is ready!
//          if data.count() > 0 {
//              return data.count()
//          }
          
          return 2
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! FoodItemTableViewCell
//          cell.editButton.addTarget(self, action: #selector(didButtonEditTapped), for: .touchUpInside)
          cell.delegate = self
          cell.editButton.tag = indexPath.row
    
          return cell
      }
    
    // MARK: - Logic
    @objc func didButtonEditTapped(){
        
    }
    
    func buttonEdit(tag: Int) {
//        let vc = MenuDetailViewController()
//        self.present(vc, animated: true, completion: nil)
        print (tag)
    }



}
