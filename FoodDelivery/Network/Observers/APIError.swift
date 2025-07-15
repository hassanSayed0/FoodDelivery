//
//  APIError.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

enum APIErrorType {

    case server
    case noData
    case parsing
    case string
    case network
    case known
    case unowned
}

struct APIError {
    
    var code: Int? = 0
    var message: String?
    var errors: ErrorsEnum?
    var type: APIErrorType
}


struct Errors: Codable {
    
    var username: [String]?
    var email: [String]?
    var phone: [String]?
    var password: [String]?
    var city: [String]?
    var area: [String]?
    var buildingNo: [String]?
    var address: [String]?
    var street: [String]?
    var emailOrPhone: [String]?
}

extension Errors {
    
    enum CodingKeys: String, CodingKey {
        
        case username
        case email
        case emailOrPhone = "email_phone"
        case phone
        case password = "new_password"
        case city
        case area
        case buildingNo = "building_number"
        case address
        case street
    }
}


enum ErrorsEnum: Codable {
    
    case strings([String])
    case attributes(Errors)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let strings = try? container.decode([String].self) {
            self = .strings(strings)
            return
        }
        if let attributes = try? container.decode(Errors.self) {
            self = .attributes(attributes)
            return
        }
        throw DecodingError.typeMismatch(ErrorsEnum.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IDS"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .strings(let strings):
            try container.encode(strings)
        case .attributes(let attributes):
            try container.encode(attributes)
        }
    }
}
