//
//  ViewController+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

extension UIViewController {
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self).replacingOccurrences(of: "ViewController", with: ""), bundle: nil)
    }
}
