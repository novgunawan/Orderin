//
//  ConfirmOrderViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import UIKit

class ConfirmOrderViewController: UIViewController {
    
    lazy var orderButtonView: OrderNowButton = {
        
        let view = OrderNowButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 4
        return view
        
    }()
    
    let confirmMenuTableView: UITableView = {
        
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupNavigationController()
        setupAddView()
        orderNowButtonConstraint()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        orderButtonView.frame.size.height = 130
        
   //     orderButtonView.frame = CGRect(x: 0, y: 729, width: 390, height: 113)
    }
    
    func setupAddView() {
        
        view.addSubview(confirmMenuTableView)
        view.addSubview(orderButtonView)
        
        
    }
    
    func setupDelegate() {
        
        confirmMenuTableView.delegate = self
        confirmMenuTableView.dataSource = self
        confirmMenuTableView.frame = view.bounds
        
        
        confirmMenuTableView.register(ConfirmMenuCell.self, forCellReuseIdentifier: Constant.ConfirmOrder.tableViewCellIdentifier)
        confirmMenuTableView.rowHeight = 150
        
    }
    
    func setupNavigationController() {
        navigationItem.title = "Confirm Order"
    }
    
    private func orderNowButtonConstraint() {
       
    }
    

}

extension ConfirmOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white
        
        let tableNumberlabel = UILabel()
        let actualTableNumber = UILabel()
        
        tableNumberlabel.frame = CGRect.init(x: 17, y: 20, width: headerView.frame.width-10, height: headerView.frame.height-10)
        tableNumberlabel.text = "Table Number:"
        tableNumberlabel.font = UIFont(name: C.fontPoppinsRegular, size: 17)
        
        actualTableNumber.frame = CGRect.init(x: 330, y: 20, width: headerView.frame.width-10, height: headerView.frame.height-10)
        actualTableNumber.text = "#20"
        actualTableNumber.font = UIFont(name: C.fontPoppinsSemibold, size: 17)
       
        headerView.addSubview(tableNumberlabel)
        headerView.addSubview(actualTableNumber)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = confirmMenuTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.tableViewCellIdentifier) as! ConfirmMenuCell
        
        cell.setContent(quantity: "2", titleOrder: "Azkake", price: "Rp.30.000")
        
        return cell
    }
    
    
}
