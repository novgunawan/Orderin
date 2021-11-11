//
//  TabbarViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    // -MARK: App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupVC()
    }

    
    // MARK: -Create Navigation Controller for Main Page with Tab Bar
    fileprivate func createNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
//        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        return navigationController
    }
    
    //MARK: -Setup ViewController for HomePage
    func setupVC() {
        viewControllers = [
            //MARK: -UiImage are not supported below iOS 15, the original was menucard and clock
            createNavigationController(for: HomeViewController(), title: NSLocalizedString("Menu", comment: ""), image: UIImage(systemName: "square.and.arrow.up")!),
            createNavigationController(for: HistoryViewController(), title: NSLocalizedString("History", comment: ""), image: UIImage(systemName: "square.and.arrow.up")!)]
    }
    
    
}
