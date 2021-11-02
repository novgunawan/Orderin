//
//  MenuListViewController.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import UIKit

class MenuListViewController: UIViewController {
    
    // MARK: - Components Declaration
    
    let menuListView = MenuUIView()
    var data: [MenuListModel] = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSegmentedControlConstraint()
        setTableViewConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        data = fetchData()
        addComponents()
        view.backgroundColor = .white
        setup()
        tableViewConfiguration()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - UI Setup
    
    private func setup(){
        navigationItem.title = "Restaurant ABCD"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = menuListView.searchController
        
        // Setup delegates
        menuListView.tableView.delegate = self
        menuListView.tableView.dataSource = self
    }
    
    private func addComponents(){
        view.addSubview(menuListView.segmentedControl)
        view.addSubview(menuListView.tableView)
            
    }
    
    private func tableViewConfiguration(){
        // set row height
        menuListView.tableView.rowHeight = 150
        // register cells
        menuListView.tableView.register(MenuListTableViewCell.self , forCellReuseIdentifier: "FoodCell")
    }
    
    
    // MARK: - Auto Layout
    
    private func setSegmentedControlConstraint(){
        menuListView.segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuListView.segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        menuListView.segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        menuListView.segmentedControl.heightAnchor.constraint(equalToConstant: 40 ).isActive = true
    }
    
    private func setTableViewConstraint(){
        menuListView.tableView.topAnchor.constraint(equalTo: menuListView.segmentedControl.bottomAnchor, constant: 26.0).isActive = true
        menuListView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuListView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        menuListView.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
  
    // MARK: - UI Logic
    
    // MARK: - Dummy Data
    
    func fetchData()->[MenuListModel]{
        let data1 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data2 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data3 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data4 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data5 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data6 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data7 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data8 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data9 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        let data10 = MenuListModel(image: UIImage(named: "food-dummy")!, title: "Food Name", description: "lalalallallalaalla lalalala", price: "Rp. Price", category: .main)
        
        return[data1, data2, data3, data4, data5, data6, data7, data8, data9, data10]
    }

   

}
