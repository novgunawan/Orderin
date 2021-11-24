//
//  HomeViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit
import AuthenticationServices
import Firebase


class HomeViewController: UIViewController {
    
    // MARK: Declaration Variables
    static var signinViewController = SignInViewController()
    var tabBarTag: Bool = true
    var scanQRVC = ScanQRCameraViewController()
    var countScan = 0
    var tempRestoID: String? {
        didSet {
            guard let tempRestoID = tempRestoID else { return }
        }
    }
    var tempTableNumber: Int? {
        didSet {
            guard let tempTableNumber = tempTableNumber else { return }
            TableNumber.tableNumber = String(tempTableNumber)
            
        }
    }
    
    // MARK: -App Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Set selected tab bar item's color
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = C.hexStringToUIColor(hex: C.teal50)
        } else {
            self.tabBarController?.tabBar.tintColor = C.hexStringToUIColor(hex: C.gray70)
        }
        
        // MARK: State Home Page
        if countScan < 1 {
            homeBeforeScan()
        } else {
            homeAfterScan()
        }
        // MARK: Set Tab Bar Not To Be Hidden
        self.tabBarController?.tabBar.isHidden = false
        
        // MARK: Set navigation bar hidden [the large title in the left]
        self.navigationController?.isNavigationBarHidden = true

    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // MARK: -Add subview Home Before Sign In
        view.addSubview(titleLabel)
        view.addSubview(homeImage)
        view.addSubview(captionLabel)
        view.addSubview(scanQRButton)
        view.addSubview(smallCaptionLabel)
        
        
        // MARK: -Add subview Home After Sign In
        
        view.addSubview(orderShortcut)
        view.addSubview(helloLabel)
        view.addSubview(infoLabel)
        view.addSubview(recommendedMenuLabel)
        view.addSubview(tableViewCollection)
        view.addSubview(browseAllMenuButton)
        view.addSubview(scanAnotherMenuButton)

        view.addSubview(signoutButton)
        scanQRVC.delegate = self
        
        //data source
        tableViewCollection.dataSource = self
        tableViewCollection.delegate = self
    }
    
    // MARK: -Functions
    
    // MARK: State Home After Scan QR
    func homeAfterScan() {
        self.titleLabel.isHidden = true
        self.homeImage.isHidden = true
        self.captionLabel.isHidden = true
        self.scanQRButton.isHidden = true
        self.smallCaptionLabel.isHidden = true
        self.signoutButton.isHidden = true
        self.tableViewCollection.isHidden = false
        self.helloLabel.isHidden = false
        self.infoLabel.isHidden = false
        self.orderShortcut.isHidden = false
        self.recommendedMenuLabel.isHidden = false
        self.browseAllMenuButton.isHidden = false
        self.scanAnotherMenuButton.isHidden = false
    }
    
    // MARK: State Home Before Scan QR
    func homeBeforeScan() {
        self.titleLabel.isHidden = false
        self.homeImage.isHidden = false
        self.captionLabel.isHidden = false
        self.scanQRButton.isHidden = false
        self.smallCaptionLabel.isHidden = false
        self.signoutButton.isHidden = false
        self.tableViewCollection.isHidden = true
        self.helloLabel.isHidden = true
        self.infoLabel.isHidden = true
        self.orderShortcut.isHidden = true
        self.recommendedMenuLabel.isHidden = true
        self.browseAllMenuButton.isHidden = true
        self.scanAnotherMenuButton.isHidden = true 
    }
    
    @objc func scanQR() {
        
        // MARK: Check user has signed in or not
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                // MARK: User is signed in.
                // TODO: Go to Scan QR
                self.present(self.scanQRVC, animated: true, completion: nil)
            } else {
                // MARK: User is not signed in.
                AlertServices.presentAlertSignedIn(onVC: self, message: "To Scan QR Code, you need to sign in first")
            }
        })
        
    }
    
    // MARK: Sign Out
    @objc func signout() {
//        Auth.auth().addStateDidChangeListener({ auth, user in
//            if let user = user {
//                // MARK: User is signed in.
//
//                let firebaseAuth = Auth.auth()
//                let user = Auth.auth().currentUser
//                do {
//                    try firebaseAuth.signOut()
//                } catch let signOutError as NSError {
//                    print("Error signing out: %@", signOutError)
//                }
//                user?.delete { error in
//                    if let error = error {
//                        // An error happened.
//                    } else {
//                        // Account deleted.
//                        print("acount deleted")
//                    }
//                }
//            } else {
//                // MARK: User is not signed in.
//                print("from home view controller : you haven't signed in")
//            }
//        })
        AlertServices.presentAlertNotYetDeveloped(onVC: self)
        
    }
    
    
    // MARK: Go to Menu List
    @objc func goToMenuListVC() {
        let menulistVC = MenuListViewController()
        self.navigationController?.pushViewController(menulistVC, animated: true)
    }
    
    // MARK: Go to menudetail when Menu Detail Tapped
    @IBAction func menuDetailDidtTapped(_ sender: Any) {
        let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: Go to direct scan qr
    @IBAction func directScanQR(_ sender: Any) {
        let directScanQR = ScanQRCameraViewController()
        self.navigationController?.pushViewController(directScanQR, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: Generate QR
    @IBAction func generateQRAction(_ sender: Any) {
        let generateQR = GenerateQRViewController()
        self.navigationController?.pushViewController(generateQR, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: -Properties for Home Before Sign In
    // MARK: Title Label
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = C.titleLabelHome0
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeTitle)
        label.textColor = C.hexStringToUIColor(hex: C.black90)
        label.textAlignment = .center
        return label
        
    }()
    
    // MARK: Image
    let homeImage: UIImageView = {
        var img = UIImage()
        img = UIImage(named: C.homeImg0) ?? UIImage()
        var images = UIImageView(image: img)
        images.frame = CGRect(x: 25, y: 231, width: 338, height: 338)
        return images
    }()
    
    // MARK: Caption
    var captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = C.captionLabelHome0
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        label.textColor = C.hexStringToUIColor(hex: C.black90)
        label.textAlignment = .center
        return label
        
    }()
    // MARK: Scan QR Menu Button
    var scanQRButton: UIButton = {
        let button = UIButton()
        button.setTitle(C.scanMenu, for: .normal)
        button.setTitleColor(C.hexStringToUIColor(hex: C.white), for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = C.hexStringToUIColor(hex: C.red50)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        return button
    }()
    
    // MARK: Small Caption
    var smallCaptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = C.smallCaptionLabelHome0
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeFootnote)
        label.textColor = C.hexStringToUIColor(hex: C.gray70)
        label.textAlignment = .center
        return label
        
    }()
    
    // MARK: -Properties for Home After Sign In
    
    var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = "Hello there!"
        return label
    }()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsRegular, size: C.fontsizeBody)
        label.text = C.infoLabel
        return label
    }()
    
    lazy var orderShortcut: OrderShortcutView = {
        let view = OrderShortcutView()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = C.hexStringToUIColor(hex: C.shadowColor).cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
        view.layer.shadowRadius = 10.0
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.tableNumberLabel.text = TableNumber.fetchTableNumber()
        return view
    }()
    
    var recommendedMenuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        label.text = C.recommendedMenuLabel
        return label
    }()
    
    var browseAllMenuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12.0
        button.backgroundColor = C.hexStringToUIColor(hex: C.red50)
        button.setTitle(C.browseMenu, for: .normal)
        button.setTitleColor(C.hexStringToUIColor(hex: C.white), for: .normal)
        button.addTarget(self, action: #selector(goToMenuListVC), for: .touchUpInside)
        return button
    }()
    
    var scanAnotherMenuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12.0
        button.layer.borderWidth = 3
        button.layer.borderColor = C.hexStringToUIColor(hex: C.red50).cgColor
        button.backgroundColor = C.hexStringToUIColor(hex: C.white)
        button.setTitle(C.scanOtherMenu, for: .normal)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        return button
    }()
    var signoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(C.signoutButton, for: .normal)
        button.titleLabel?.font = UIFont(name: C.fontPoppinsSemibold, size: C.fontsizeBody)
        button.setTitleColor(C.hexStringToUIColor(hex: C.red50), for: .normal)
        button.addTarget(self, action: #selector(signout), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Collection View
    
    var tableViewCollection: UITableView = {
        let table = UITableView()
        table.register(CarouselCollectionTableViewCell.self, forCellReuseIdentifier: CarouselCollectionTableViewCell.identifier)
        table.separatorColor = .clear
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //TODO: - Move Assign Data to the right model data
    let viewModels: [CarouselCollectionTableViewCellViewModel] = [
        CarouselCollectionTableViewCellViewModel(viewModels: [TileCollectionViewCellViewModel(name: "French Fries", image: UIImage(named: "french-fries")!), TileCollectionViewCellViewModel(name: "Sausages", image: UIImage(named: "sausages")!), TileCollectionViewCellViewModel(name: "Salad", image: UIImage(named: "salad")!), TileCollectionViewCellViewModel(name: "Chicken Katsu", image: UIImage(named: "chiken-katsu")!), TileCollectionViewCellViewModel(name: "Fried Rice", image: UIImage(named: "fried-rice")!)
                                                             ])
    ]
    
    // MARK: -Constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableViewCollection.frame = view.bounds
        
        // MARK: -Constraint Home Before Sign In
        
        // MARK: Constraint for title label
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 74.5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -73.5).isActive = true
        
        // MARK: Constraint for image
        homeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        homeImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26.0).isActive = true
        homeImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26.0).isActive = true
        
        //        // MARK: Constraint caption
        captionLabel.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 8.0).isActive = true
        captionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37.0).isActive = true
        captionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -38.0).isActive = true
        
        //        // MARK: Constraint scan qr button
        scanQRButton.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 24.5).isActive = true
        scanQRButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 61.5).isActive = true
        scanQRButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -61.5).isActive = true
        scanQRButton.heightAnchor.constraint(equalToConstant: 53.3).isActive = true
        
        //        // MARK: Constraint small caption
        smallCaptionLabel.topAnchor.constraint(equalTo: scanQRButton.bottomAnchor, constant: 7.5).isActive = true
        smallCaptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 42.0).isActive = true
        smallCaptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -43.0).isActive = true
        
        // MARK: Constraint Sign Out Button
        signoutButton.leadingAnchor.constraint(equalTo: smallCaptionLabel.leadingAnchor, constant: 0.0).isActive = true
        signoutButton.trailingAnchor.constraint(equalTo: smallCaptionLabel.trailingAnchor, constant: 0.0).isActive = true
        signoutButton.bottomAnchor.constraint(equalTo: smallCaptionLabel.bottomAnchor, constant: 53.0).isActive = true
        // MARK: -Constraint Home After Sign In
        
        // MARK: Constraint Hello Label
        helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 31.5).isActive = true
        helloLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -116.5).isActive = true
   
        // MARK: Constraint Info Label
        infoLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 30.0).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor, constant: 0.0).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: helloLabel.trailingAnchor, constant: 0.0).isActive = true
        
        // MARK: Constraint Order Shortcut View
        orderShortcut.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 19.0).isActive = true
        orderShortcut.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12.0).isActive = true
        orderShortcut.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19.0).isActive = true
        orderShortcut.heightAnchor.constraint(equalToConstant: 154.0).isActive = true
        
        // MARK: Constraint Recommended Menu Label Collection View
        recommendedMenuLabel.topAnchor.constraint(equalTo: orderShortcut.bottomAnchor, constant: 24.0).isActive = true
        recommendedMenuLabel.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor, constant: 0.0).isActive = true
        recommendedMenuLabel.trailingAnchor.constraint(equalTo: helloLabel.trailingAnchor, constant: 0.0).isActive = true
   
        // MARK: Constraint Button Browse All Menu
        browseAllMenuButton.topAnchor.constraint(equalTo: tableViewCollection.bottomAnchor, constant: 32.0).isActive = true
        browseAllMenuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15.5).isActive = true
        browseAllMenuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.5).isActive = true
        browseAllMenuButton.heightAnchor.constraint(equalToConstant: 53.3).isActive = true
        
        // MARK: Constraint Button Scan Another Menu
        scanAnotherMenuButton.topAnchor.constraint(equalTo: browseAllMenuButton.bottomAnchor, constant: 12.5).isActive = true
        scanAnotherMenuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0).isActive = true
        scanAnotherMenuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0).isActive = true
        scanAnotherMenuButton.heightAnchor.constraint(equalToConstant: 53.3).isActive = true
        
        //MARK: Constraint Collection View (Carousel)
        tableViewCollection.topAnchor.constraint(equalTo: recommendedMenuLabel.bottomAnchor, constant: 16.0).isActive = true
        tableViewCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12.0).isActive = true
        tableViewCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -19.0).isActive = true
        tableViewCollection.heightAnchor.constraint(equalToConstant: 202.0).isActive = true
    }
}

extension HomeViewController: NavigationControllerDelegate {
    func pushToConfirmOrder() {
        let confirmOrderVC = EmptyStateViewController()
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(confirmOrderVC, animated: true)
    }
}

extension HomeViewController: GoToHomeAfterScanDelegate {
    func gotoHomeAfterScan() {
        let homeAfterScanVC = HomeViewController()
        
        homeAfterScanVC.countScan += 1
        homeAfterScanVC.tempRestoID = scanQRVC.tempRestoID
        homeAfterScanVC.tempTableNumber = scanQRVC.tempTableNumber
        self.navigationController?.pushViewController(homeAfterScanVC, animated: false)
    }
    
    
}
