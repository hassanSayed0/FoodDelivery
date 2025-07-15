//
//  ImageMedia.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

struct ImageMedia: Codable  {
    
    var key: String?
    var filename: String?
    var data: Data?
    var mimeType: String?
    
    init?(withImage image: UIImage, imageName: String, forKey key: String, mimeType: mimeType, withCompression value: CGFloat) {

        self.key = key
        self.mimeType = mimeType.rawValue
        self.filename = imageName + mimeType.extention

        if mimeType == .jpgImage {
            guard let jpegData = image.jpegData(compressionQuality: value) else { return nil }
            self.data = jpegData
        } else {
            guard let pngData = image.pngData() else { return nil }
            self.data = pngData
        }
    }
}

extension ImageMedia {
    
    enum CodingKeys: String, CodingKey {
        
        case key
        case filename
        case data
        case mimeType
    }
}

enum mimeType: String {
    
    case pngImage = "image/png"
    case jpgImage = "image/jpeg"
    
    var extention: String {
        switch self {
        case .jpgImage:
            return ".jpg"
        case .pngImage:
            return ".png"
        }
    }
}
