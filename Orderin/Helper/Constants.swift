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
    static let fontsizeTitle = 34.0
    static let fontsizeTitle3 = 20.0
    static let fontsizeBody = 17.0
    static let fontsizeFootnote = 13.0
    
    
    // MARK: -Colors
    static let red90 = "#320D07"
    static let red70 = "#962513"
    static let red50 = "#E84C34"
    static let red30 = "#F49688"
    static let red10 = "#FCDCD8"
    
    // MARK: -Labels
    // MARK: Sign in
    static let titleLabel = "Enjoy Dine In with"
    static let titleLabel2 = "OrderIn"
    static let titleskipButton = "Skip for now"
    
    // MARK: -Images Name
    // MARK: Sign in
    static let signinImg = "front-image-0"
    
    
    // MARK: Functions
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
    
    struct Constant {
        struct CancelOrder {
            static let cancelViewController = "CancelOrderViewController"
            static let keypathAnimation = "strokeEnd"
            static let fontName = "Poppins-Semibold"
        }
        
        struct OrderSummary {
            static let orderViewController = "OrderSummary"
        }
        
        
        
    }
}
