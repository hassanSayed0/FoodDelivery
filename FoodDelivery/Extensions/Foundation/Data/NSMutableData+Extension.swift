//
//  NSMutableData+Extension.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import Foundation

extension Data {

    mutating func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
