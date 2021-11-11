//
//  ConfirmOrderViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import UIKit

class ConfirmOrderViewController: UIViewController {
    
    var viewModel = CellConfirmationViewModel()
   
    var data: [MenuCustomizationDummyData] = []
    var rowHeight: CGFloat = 50
    
    lazy var orderButtonView: OrderNowButton = {
        
        let view = OrderNowButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    var subtotalView: NotesView = {
        
        let view = NotesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    let confirmMenuTableView: UITableView = {
        
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingData()
        setupDelegate()
        setupNavigationController()
        setupAddView()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
     
        
        orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        orderButtonView.heightAnchor.constraint(equalToConstant: view.frame.height / 6).isActive = true
        
        setupTableViewConstraint()
        setupTotalPriceConstraint()
    }
    
    func setupAddView() {
        
        view.addSubview(confirmMenuTableView)
        view.addSubview(orderButtonView)
        view.addSubview(subtotalView)
        
        
    }
    
    func setupDelegate() {
        
        confirmMenuTableView.delegate = self
        confirmMenuTableView.dataSource = self        
        
        confirmMenuTableView.register(ConfirmMenuCell.self, forCellReuseIdentifier: Constant.ConfirmOrder.tableViewCellIdentifier)
        rowHeight += CGFloat(25 * (data.count + 1))
        
        confirmMenuTableView.rowHeight = rowHeight
        
    
    }
    
    func setupTableViewConstraint() {
        confirmMenuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        confirmMenuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        confirmMenuTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        confirmMenuTableView.bottomAnchor.constraint(equalTo: subtotalView.topAnchor, constant: 11).isActive = true

    }
    
    func setupTotalPriceConstraint() {
        subtotalView.backgroundColor = .cyan
        
        subtotalView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        subtotalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        subtotalView.bottomAnchor.constraint(equalTo: orderButtonView.topAnchor, constant: 0).isActive = true
        subtotalView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func setupNavigationController() {
        navigationItem.title = "Confirm Order"
    }
    
    private func bindingData() {
        
        viewModel.fetchMenuCustomization(completion: { value in
            self.data = value
            
        })
        
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = confirmMenuTableView.dequeueReusableCell(withIdentifier: Constant.ConfirmOrder.tableViewCellIdentifier) as! ConfirmMenuCell
        
        cell.setContent(quantity: "2", titleOrder: "Steak", price: "Rp 90.000")
        cell.delegate = self
        
        return cell
    }
}

extension ConfirmOrderViewController: editButtonDelegate {
    
    func editButtonDidTap() {
        let vc = MenuDetailViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
