//
//  BottomSheetViewController.swift
//  Orderin
//
//  Created by Nathaniel Andrian on 03/11/21.
//

import UIKit

class BottomSheetViewController: UIViewController{

    
    // MARK: - Variables Declaration
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    // MARK: - UI Components Declaration
    
    let tableView: UITableView = {
        
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints  = false
        table.allowsSelection = false
        
        return table
    }()
    
    let tray: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = C.hexStringToUIColor(hex: C.chineseWhite)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 3.0
        
        return view
    }()
    
  
    let makeAnotherButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Make Another", for: .normal)
        button.backgroundColor = C.hexStringToUIColor(hex: C.red50)
        button.layer.cornerRadius = 13.0
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(proccedToMenuDetail), for: .touchUpInside)
        
        return button
        
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        view.addSubview(tray)
        view.addSubview(tableView)
        configTable()
        view.addSubview(makeAnotherButton)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
            
            
        }
        
        tray.topAnchor.constraint(equalTo: view.topAnchor, constant: 16.0).isActive = true
        tray.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tray.heightAnchor.constraint(equalToConstant: 5.0).isActive = true
        tray.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        tableView.topAnchor.constraint(equalTo: tray.bottomAnchor,constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: makeAnotherButton.topAnchor,constant: -30).isActive = true
        
        makeAnotherButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -35).isActive = true
        makeAnotherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 19).isActive = true
        makeAnotherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -19).isActive = true
        makeAnotherButton.heightAnchor.constraint(equalToConstant: 53.0).isActive = true
        
    }
    
    
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        tableView.register(FoodItemTableViewCell.self, forCellReuseIdentifier: "item")
        
        
    }
    
   
    
    // MARK: - Gesture
        
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    @objc func proccedToMenuDetail() {
        
        let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
  

}
