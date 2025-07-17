//
//  UIFont+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//
import UIKit
struct AppFontName {

    static let robotoRegular = "roboto-regular"
    static let robotoMedium = "roboto-medium"
    static let robotoBold = "roboto-bold"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
       
    @objc class func robotoRegularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.robotoRegular, size: size) ??
        UIFont.robotoRegularFont(ofSize: size)
    }

    @objc class func mediumFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.robotoMedium, size: size) ??
        UIFont.mediumFont(ofSize: size)
    }
    
//
    @objc class func robotoBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.robotoBold, size: size) ??
            UIFont.robotoBoldFont(ofSize: size)
    }
               
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        if fontAttribute.lowercased().range(of: "regular") != nil {
            fontName = AppFontName.robotoRegular
        } else if fontAttribute.lowercased().range(of: "medium") != nil {
            fontName = AppFontName.robotoMedium
        } else if fontAttribute.lowercased().range(of: "bold") != nil {
            fontName = AppFontName.robotoBold
        } else  {
            fontName = AppFontName.robotoRegular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(robotoRegularFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(robotoBoldFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
