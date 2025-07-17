//
//  ChachingManager.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import UIKit

class CachingManager {
    
    let defaults = UserDefaults.standard
        
    func store<T>(_ object: T, _ key: String) {
        do {
            var data: Data?
            if let _ = object.self as? Codable.Type {
                guard let dataCodable = object.self as? Codable else { return }
                let dataEncoded = try PropertyListEncoder().encode(dataCodable)
                data = try? NSKeyedArchiver.archivedData(withRootObject: dataEncoded, requiringSecureCoding: false)
            } else {
                data = try? NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: true)
            }
            defaults.set(data, forKey: key)
            defaults.synchronize()
        } catch {
            return
        }
    }
    
    func retrive<T>(_ key: String) -> T! {
        do {
            if isExist(key) {
                let data = defaults.object(forKey: key) as? Data
                let object = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSNumber.self, NSString.self, NSDictionary.self, NSArray.self], from: data!) as? T
                if let dataEncoded = object.self as? Codable.Type {
                    let objectDecoded = try PropertyListDecoder().decode(dataEncoded, from: (object as? Data)!) as? T
                    return objectDecoded
                }
                return object
            }
            return nil
        } catch {
            return nil
        }
    }
    
    func isExist(_ key: String) -> Bool {
        return defaults.object(forKey: key) != nil
    }
    
    func delete(_ key: String) {
        if defaults.object(forKey: key) != nil {
            defaults.removeObject(forKey: key)
        }
    }
}
