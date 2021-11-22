//
//  MenuListViewController.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 01/11/21.
//

import UIKit

class MenuListViewController: UIViewController{
    
    
    // MARK: - Components Declaration
    
    let menuListView = MenuUIView()
    let floatingButton = FloatingButtonView()
    var data: [Menu] = []
    var menuListVM = MenuListViewModel()
    var dataWithoutCategory: [MenuListModel] = []
    var filteredData: [MenuListModel] = []
    var searchingState = false
    var sectionIndex = 0
    var rowIndex = 0
   


    
    // MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSegmentedControlConstraint()
        setTableViewConstraint()
        setModalBackViewConstraint()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindData()
        
        addComponents()
        view.backgroundColor = .white
        setup()
        tableViewConfiguration()
       
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        menuListView.segmentedControl.addTarget(self, action: #selector(didSegmentChange), for: .valueChanged)
        self.navigationController?.navigationBar.tintColor = C.hexStringToUIColor(hex: C.red50)

        floatingButton.delegate = self
        
    }
    
    // MARK: - UI Setup
    
    private func setup(){
        navigationItem.title = "Restaurant ABCD"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = menuListView.searchController
        
        // Setup delegates
        menuListView.tableView.delegate = self
        menuListView.tableView.dataSource = self
        menuListView.searchController.searchBar.delegate = self
        menuListView.searchController.searchResultsUpdater = self
        

    }
    
    private func addComponents(){
        view.addSubview(menuListView.segmentedControl)
        view.addSubview(menuListView.tableView)
        view.addSubview(floatingButton)
     
    }
    
    private func tableViewConfiguration(){
        // set row height
        menuListView.tableView.rowHeight = 150
        // register cells
        menuListView.tableView.register(MenuListTableViewCell.self , forCellReuseIdentifier: "FoodCell")
    }
    
    
// MARK: create activity indicator view
    
    func createActivityIndicatorView(){
        let child =  ActivityIndicatorViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
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
        menuListView.tableView.bottomAnchor.constraint(equalTo: floatingButton.topAnchor).isActive = true

    }
    
    private func setModalBackViewConstraint(){

        floatingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive =  true
        floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive =  true
        floatingButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
  
    // MARK: - UI Logic
    
    func bindData(){
        menuListVM.fetchMenuListData { value in
            self.data = value
            
            DispatchQueue.main.async {
                self.menuListView.tableView.reloadData()


            }
        }
        
        menuListVM.fetchMenuWithoutCategory { value in
            self.dataWithoutCategory = value
        }
    }
    @objc func didSegmentChange(_ sender: UISegmentedControl){
        switch menuListView.segmentedControl.selectedSegmentIndex{
        case 0 :
            let index = NSIndexPath(row: 0, section: 0)
            menuListView.tableView.scrollToRow(at: index as IndexPath, at: .top, animated: true)
            
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

extension MenuListViewController: NavigationControllerDelegate {
    
    func pushToConfirmOrder() {
        let confirmOrderVC = ConfirmOrderViewController()
        self.navigationController?.pushViewController(confirmOrderVC, animated: true)
    }
    
    
}
