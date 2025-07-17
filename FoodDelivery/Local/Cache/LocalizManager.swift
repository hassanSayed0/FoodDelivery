//
//  LocalizManager.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import UIKit

enum Language: String {
    
    case EN = "en"
    case AR = "ar"
    case SA = "sa"
}

class LocalizManager: CachingManager {
    
    let key = "AppLanguage"
    let APPLE_LANGUAGES = "AppleLanguages"
    
    static var shared = LocalizManager()
    
    func save(_ lang: Language) {
        var appleLanguages = defaults.object(forKey: APPLE_LANGUAGES) as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(lang.rawValue, at: 0)
        defaults.set(appleLanguages, forKey: APPLE_LANGUAGES)
        defaults.synchronize()
        
        store(lang.rawValue, key)
    }
    
    func get() -> String! {
        if isExist() {
            return retrive(key)
        } else {
            return String(Locale.preferredLanguages[0].prefix(2))
        }
    }
    
    func isExist() -> Bool {
        return isExist(key)
    }
    
    func delete() {
        delete(key)
    }
}
