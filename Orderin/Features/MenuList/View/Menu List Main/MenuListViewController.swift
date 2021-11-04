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
    var data: [Menu] = []
    var menuListVM = MenuListViewModel()
   
    
    // MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSegmentedControlConstraint()
        setTableViewConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        data = fetchData()
        bindData()
        addComponents()
        view.backgroundColor = .white
        setup()
        tableViewConfiguration()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        menuListView.segmentedControl.addTarget(self, action: #selector(didSegmentChange), for: .valueChanged)
        
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
    
    func bindData(){
        menuListVM.fetchMenuListData { value in
            self.data = value
            
            DispatchQueue.main.async {
                self.menuListView.tableView.reloadData()
            }
        }
    }
    @objc func didSegmentChange(_ sender: UISegmentedControl){
        switch menuListView.segmentedControl.selectedSegmentIndex{
        case 0 :
            print("show all 0 ")
        case 1:
            let index = NSIndexPath(row: 0, section: 0)
            menuListView.tableView.scrollToRow(at: index as IndexPath, at: .top, animated: true)
            
        case 2:
            let index = NSIndexPath(row: 0, section: 1)
            menuListView.tableView.scrollToRow(at: index as IndexPath, at: .top, animated: true)
            
        case 3:
            let index = NSIndexPath(row: 0, section: 2)
            menuListView.tableView.scrollToRow(at: index as IndexPath, at: .top, animated: true)
        case 4:
            print("show all 4 ")
            let index = NSIndexPath(row: 0, section: 3)
            menuListView.tableView.scrollToRow(at: index as IndexPath, at: .top, animated: true)
            
        default:
            print("nothing")
        }
    }
   
    

}

extension MenuListViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
       PresentationController(presentedViewController: presented, presenting: presenting)
   }
}
