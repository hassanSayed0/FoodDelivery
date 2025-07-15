//
//  Data+String.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import Foundation

public extension Data {
    
    /**
     Converts a data object to an utf8 string.
     
     - returns: The utf8 string or nil
     */
    var utf8String: String {
        return String(decoding: self, as: UTF8.self)
    }
}
