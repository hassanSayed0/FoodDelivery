//
//  UIColor+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import UIKit

extension UIColor {

    static let primaryLight = UIColor(hex: 0x0FEDE2)
    static let primaryDark = UIColor(hex: 0x00254D)
    static let blackApp = UIColor(hex: 0x17001A)
    static let textBlackApp = UIColor(hex: 0x212121)
    static let primaryMainGreen = UIColor(hex: 0x6F8078)
    static let backgroundOtpOpactiy = UIColor(hex: 0xEFEFF0).withAlphaComponent(0.5)
    static let linearGreen = [UIColor.primaryLight.cgColor, UIColor.primaryDark.cgColor]
    static let linearPurple = [UIColor(hex: 0x1867BC).cgColor, UIColor(hex: 0xC741D7).cgColor, UIColor(hex: 0xFFA049).cgColor]
    static let borderGrayLanguage = UIColor(hex: 0xF3F3F3)
    static let primaryRed = UIColor(hex: 0xE02B1D)
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, a: a)
    }
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
    func hexStringToUIColor(hex: String) -> UIColor {
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
}
