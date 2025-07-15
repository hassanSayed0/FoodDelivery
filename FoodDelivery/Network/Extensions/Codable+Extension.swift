//
//  Codable+Extension.swift
//  Network Layer
//
//  Created by MhMuD SalAh on 24/06/2022.
//  Copyright © 2022 MhMuD SalAh. All rights reserved.
//

import Foundation

extension Encodable {
    
    var dictionary: [String: Any]? {
       guard let data = try? JSONEncoder().encode(self) else { return nil }
       return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
     }
    
    func asDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }
            return dictionary
        } catch {
            return nil
        }
    }
}


