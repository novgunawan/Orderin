//
//  ConfirmOrderViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 09/11/21.
//

import UIKit

class ConfirmOrderViewController: UIViewController {
    
    // MARK: Confirm Page
    
    var viewModel = CellConfirmationViewModel()
    
    var data: [OrderedMenuCustomizationDummyData] = []
    var rowHeight: CGFloat = 50
    
    // MARK: Order now Button View
    lazy var orderButtonView: OrderNowButton = {
        
        let view = OrderNowButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13.0
        view.backgroundColor = UIColor(named: "broken white")
        
        
        // MARK: Adding Tap Recognizer for the Button
        view.orderNowButton.addTarget(self, action: #selector(orderDidTap), for: .touchUpInside)
        return view
        
    }()
    
    // MARK: Sub Total Label
    var subtotalView: subTotalView = {
        
        let view = subTotalView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    // MARK: Table View dengan Table Number sebagai header dan notes sebagai footer
    let confirmMenuTableView: UITableView = {
        
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
        
    }()
    
    let notesTextField: UITextField = {
        let notesTextField = UITextField()
        
        notesTextField.placeholder = "E.g: Add 1 more Bowl"
        notesTextField.font = UIFont.systemFont(ofSize: 17)
        notesTextField.borderStyle = UITextField.BorderStyle.roundedRect
        notesTextField.frame = CGRect(x: 0, y: 0, width: 150, height: 20)
        
        return notesTextField
        
    }()
    
    // MARK: App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingData()
        setupDelegate()
        setupNavigationController()
        setupAddView()
        dismissKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        orderButtonView.heightAnchor.constraint(equalToConstant: view.frame.height / 8).isActive = true
        
        setupTableViewConstraint()
        setupTotalPriceConstraint()
    }
    
    // MARK: Add View
    
    func setupAddView() {
        
        view.addSubview(confirmMenuTableView)
        view.addSubview(orderButtonView)
        view.addSubview(subtotalView)
        
        
    }
    
    func setupDelegate() {
        
        confirmMenuTableView.delegate = self
        confirmMenuTableView.dataSource = self
        notesTextField.delegate = self
        
        
        
        confirmMenuTableView.register(ConfirmMenuCell.self, forCellReuseIdentifier: Constant.ConfirmOrder.tableViewCellIdentifier)
        
        
        rowHeight += CGFloat(25 * (data.count + 1))
        
        confirmMenuTableView.rowHeight = rowHeight
        
        
    }
    
    func setupTableViewConstraint() {
        confirmMenuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        confirmMenuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        confirmMenuTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        confirmMenuTableView.bottomAnchor.constraint(equalTo: subtotalView.topAnchor, constant: 30).isActive = true
        
    }
    
    func setupTotalPriceConstraint() {
        
        subtotalView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        subtotalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        subtotalView.bottomAnchor.constraint(equalTo: orderButtonView.topAnchor, constant: 0).isActive = true
        subtotalView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func setupNavigationController() {
        navigationItem.title = "Confirm Order"
    }
    
    // MARK: Function when button order are tap ( Not Finished )
    @objc func orderDidTap() {
        let alertController = UIAlertController(title: "Confirm Order?",
                                                message: "Once you made your order, you only have 5 seconds to cancel it.",
                                                preferredStyle: .alert)
        
        let orderAlert = UIAlertAction(title: "Order", style: .default, handler: { _  in
            
            let cancelViewController = CancelOrderViewController(nibName: Constant.CancelOrder.cancelViewController, bundle: nil)
            cancelViewController.modalPresentationStyle = .fullScreen
            self.present(cancelViewController, animated: true, completion: nil)
            
        })
        
        orderAlert.setValue(UIColor(named: "blue alert"), forKey: "titleTextColor")
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alertController.addAction(orderAlert)
        
        self.present(alertController, animated: true, completion: nil)
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
        
        // MARK: Configuration Table Number Label
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return notesTextField
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 55
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            confirmMenuTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height , right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        confirmMenuTableView.contentInset = .zero
    }
}

extension ConfirmOrderViewController: editButtonDelegate {
    
    func editButtonDidTap() {
        let vc = MenuDetailViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
