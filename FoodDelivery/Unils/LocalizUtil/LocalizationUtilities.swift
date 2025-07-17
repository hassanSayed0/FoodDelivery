//
//  LocalizationUtilities.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//
import UIKit

let LOCALIZ = LocalizationUtilities.shared

class LocalizationUtilities: NSObject {
    
    var bundle: Bundle!
    
    class var shared: LocalizationUtilities {
        struct Singleton {
            static let instance: LocalizationUtilities = LocalizationUtilities()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    var isEN: Bool {
        LocalizManager.shared.get() == Language.EN.rawValue
    }
    
    var isAR: Bool {
        LocalizManager.shared.get() == Language.AR.rawValue
    }
    
    var isSA: Bool {
        LocalizManager.shared.get() == Language.SA.rawValue
    }
    
    func localizedString(key: String) -> String {
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    func localizedImagePathForImg(imagename: String, type: String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    func storeLanguage(language: Language) {
        LocalizManager.shared.save(language)
        if let languageDirectoryPath = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLanguage()
        }
    }
    
    func resetLanguage() {
        bundle = Bundle.main
    }
    
    func getLanguage() -> String {
        return LocalizManager.shared.get()
    }
        
    func setDefaultAppLocale() {
        let locale = Locale.current.languageCode
        if let lang = locale?.prefix(2), lang == Language.AR.rawValue {
            setLocale(.AR, .forceRightToLeft)
        } else if let lang = locale?.prefix(2), lang == Language.SA.rawValue {
            setLocale(.SA, .forceRightToLeft)
        } else {
            setLocale(.EN, .forceLeftToRight)
        }
    }
    
    func setLocale(_ language: Language, _ semanticContent: UISemanticContentAttribute? = nil) {
        storeLanguage(language: language)
        if semanticContent != nil {
            UIView.appearance().semanticContentAttribute = semanticContent!
            UIButton.appearance().semanticContentAttribute = semanticContent!
            UITextView.appearance().semanticContentAttribute = semanticContent!
            UITextField.appearance().semanticContentAttribute = semanticContent!
            UIStackView.appearance().semanticContentAttribute = semanticContent!
            UILabel.appearance().semanticContentAttribute = semanticContent!
            UITableView.appearance().semanticContentAttribute = semanticContent!
            UITableViewCell.appearance().semanticContentAttribute = semanticContent!
            UICollectionView.appearance().semanticContentAttribute = semanticContent!
            UICollectionViewCell.appearance().semanticContentAttribute = semanticContent!
            UIControl.appearance().semanticContentAttribute = semanticContent!
            UISwitch.appearance().semanticContentAttribute = semanticContent!
            UIPageControl.appearance().semanticContentAttribute = semanticContent!
        }
    }
}

