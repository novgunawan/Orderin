//
//  Constants.swift
//  Orderin
//
//  Created by Novi Gunawan on 27/10/21.
//

import Foundation
import UIKit
struct C {
    static let signinNibName = "SignInViewController"
    
    
    // MARK: -Fonts
    static let fontPoppinsRegular = "Poppins-Regular"
    static let fontPoppinsSemibold = "Poppins-SemiBold"
    static let fontPoppinsBold = "Poppins-Bold"
    static let fontsizeTitle = 34.0
    static let fontsizeTitle1 = 28.0
    static let fontsizeTitle2 = 22.0
    static let fontsizeTitle3 = 20.0
    static let fontsizeBody = 17.0
    static let fontsizeFootnote = 13.0
    
    
    // MARK: -Colors
    static let red90 = "#320D07"
    static let red70 = "#962513"
    static let red50 = "#E84C34"
    static let red30 = "#F49688"
    static let red10 = "#FCDCD8"
    
    static let teal90 = "#0B1316"
    static let teal70 = "#273A3F"
    static let teal50 = "#406169"
    static let teal30 = "#81A5AE"
    static let teal10 = "#D5E1E4"
    
    static let mint90 = "#233528"
    static let mint70 = "#6D9C79"
    static let mint50 = "#DEE8E0"
    static let mint30 = "#EBF1ED"
    static let mint10 = "#F9FAF9"
    
    static let black90 = "#202020"
    static let shadowColor = "#DDDDDD"
    static let gray70 = "#BEBEBE"
    static let gray50 = "#DDDDDD"
    static let white = "#FBFBFB"
    static let whiteGradientUp = "#F1F1F1"
    static let whiteGradientDown = "#F6F5F5"
    
    static let blackOlive = "3F3F3F"
    
    static let chineseWhite = "E0E0E0"
    
    // MARK: -Labels
    // MARK: Sign in
    static let titleLabel = "Enjoy Dine In with"
    static let titleLabel2 = "OrderIn"
    static let titleskipButton = "Skip for now"
    static let signoutButton = "Sign Out"
    
    // MARK: Home Before Sign In
    static let titleLabelHome0 = "Hello There"
    static let captionLabelHome0 = "Delicious food are waiting for you!"
    static let buttonTextHome0 = "Scan Menu"
    static let smallCaptionLabelHome0 = "Scan the QR at your table to start ordering."
    
    
    // MARK: Home After Sign In
    static let infoLabel = "You are currently dining in at"
    static let recommendedMenuLabel = "Recommended Menu"
    // MARK: -Images Name
    // MARK: Sign in
    static let signinImg = "front-image-0"
    
    // MARK: Home
    static let homeImg0 = "home-image-0"
    
    // MARK: OrderShortcut
    static let orderShortcutImg = "orderShortcutImage"
    
    
    // MARK: -Button Text
    // MARK: Home Before Sign In
    static let scanMenu = "Scan Menu"
    
    
    // MARK: Home After Sign In
    static let browseMenu = "Browse All Menu"
    static let scanOtherMenu = "Scan Another Menu"
    
    
    // MARK: -Name
    static let recommendedMenuCellIdentifier = "RecommendedMenuCell"
    // MARK: -Functions
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    struct UserDefaultKey {
        static let keyChooseCustomization = "chooseCustomization"
        static let keyOptionalCustomization = "optionalCustomization"
        static let keyOptionalCustomizationPrice = "optionalCustomizationPrice"
        static let keyUserID = "userID"
    }
}

struct Constant {
    struct CancelOrder {
        static let cancelViewController = "CancelOrderViewController"
        static let keypathAnimation = "strokeEnd"
        static let fontName = "Poppins-Semibold"
    }
    
    struct OrderSummary {
        static let orderViewController = "OrderSummary"
    }
    struct ConfirmOrder {
        static let tableViewCellIdentifier = "ConfirmMenuCell"
        static let menuCustomCell = "menuCustomCell"
        static let editButtonCell = "editButtonCell"
        static let notesCell = "notesCell"
        static let notesView = "notesViewIdentifier"
    }
    
    
    
    
}
