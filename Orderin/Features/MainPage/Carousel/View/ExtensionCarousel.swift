//
//  ExtensionCarousel.swift
//  Orderin
//
//  Created by Pieter Yonathan on 18/11/21.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselCollectionTableViewCell.identifier, for: indexPath) as? CarouselCollectionTableViewCell else{
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
}
