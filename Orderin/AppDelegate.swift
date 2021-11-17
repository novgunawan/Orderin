//
//  AppDelegate.swift
//  Orderin
//
//  Created by Novi Gunawan on 26/10/21.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = TabbarViewController()
        
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                // MARK: User is signed in.
                self.window?.rootViewController = home
                
            } else {
                // MARK: User is not signed in.
                let signInVC = SignInViewController()
                self.window?.rootViewController = signInVC
            }
        })
        window?.makeKeyAndVisible()
        
        // MARK: Set Navigation Bar Tint Color to be orange
        UINavigationBar.appearance().tintColor = C.hexStringToUIColor(hex: C.red50)
        return true
    }
    

    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

