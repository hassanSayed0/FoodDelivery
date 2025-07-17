//
//  UITextView+Extension.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import UIKit
    
extension UITextView {
    
    @IBInspectable var placeholderColor: UIColor {
        get {
            return self.textColor ?? .lightGray
        }
        set {
            self.textColor = newValue
        }
    }

    func localize() {
        self.textAlignment = (LOCALIZ.isEN ? .left : .right)
    }

}
