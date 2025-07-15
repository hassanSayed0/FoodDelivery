//
//  Codable+Extension.swift
//  Network Layer
//
//  Created by MhMuD SalAh on 24/06/2022.
//  Copyright © 2022 MhMuD SalAh. All rights reserved.
//

import Foundation

let CONVERTER = Converter.shared

class Converter {
    
    static let shared = Converter()
    
    static func toData(_ object: Any) -> Data {
        var jsonData: Data!
        if (object is String) {
            jsonData = (object as! String).data(using: .utf8)!
        } else {
            do {
                jsonData = try JSONSerialization.data(withJSONObject: object, options: [])
            } catch _ as NSError {
            } catch {
            }
        }
        return jsonData
    }
    
    func toBodyData(_ parameters: [String : Any]?, _ images: [ImageMedia], _ boundary: String) -> Data {

        let lineBreak = "\r\n"
        var body = Data()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary + lineBreak)")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.appendString(string: "\(value)" + "\(lineBreak)")
            }

        }
        
        for photo in images {
            body.appendString(string: "--\(boundary + lineBreak)")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(photo.key!)\"; filename=\"\(photo.filename!)\"\(lineBreak)")
            body.appendString(string: "Content-Type: \(photo.mimeType! + lineBreak + lineBreak)")
            body.append(photo.data! as Data)
            body.appendString(string: lineBreak)
        }
        
        body.appendString(string: "--\(boundary)--\(lineBreak)")
        return body
    }

}

