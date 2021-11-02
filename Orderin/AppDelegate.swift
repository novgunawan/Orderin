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
        let db = Firestore.firestore()
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = TabbarViewController()
        
        let user = Auth.auth().currentUser
        var credential: AuthCredential
        
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
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        let user = Auth.auth().currentUser
        //        user?.delete { error in
        //          if let error = error {
        //            // An error happened.
        //          } else {
        //            // Account deleted.
        //              print("acount deleted")
        //          }
        //        }
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

