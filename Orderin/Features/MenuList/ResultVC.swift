//
//  ResultVC.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 10/11/21.
//

import UIKit

class ResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var filteredMenu : [MenuListModel] = []
    
    
    
    let tableView: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.allowsSelection = true
        table.isUserInteractionEnabled  = true
        table.backgroundColor = .white
        
        return table
        
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableViewConfiguration()
       // print(filteredMenu.count)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTableViewConstraint()
        
        
        
    }
    
    override func didChangeValue(forKey key: String) {
        super.didChangeValue(forKey: key)
        
    }
    private func setTableViewConstraint(){
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
    }
    
    private func tableViewConfiguration(){
        // set row height
        tableView.rowHeight = 150
        // register cells
        tableView.register(MenuListTableViewCell.self , forCellReuseIdentifier: "FoodCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! MenuListTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        let dummy = filteredMenu[indexPath.row]
        cell.dataModel = dummy
        cell.button.tag = indexPath.row
//        cell.delegate = self
//        cell.button.addTarget(self, action: #selector(didAddButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    
  
    

  

}
