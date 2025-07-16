//
//  APIData.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import Foundation

/// The generic response for current API

struct APIData<T: Decodable>: Decodable {
    
    var status: Bool
    var message: String?
    var errors: ErrorsEnum?
    var data: T?
    
}
extension APIData {
    
    enum CodingKeys: String, CodingKey {
        case status = "success"
        case message
        case errors
        case data
    }
}
