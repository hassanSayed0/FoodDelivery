//
//  ViewController+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

extension UIViewController {
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    static func loadFromStoryboard<T: UIViewController>() -> T {
        return UIStoryboard(name: String(describing: self).replacingOccurrences(of: "ViewController", with: ""), bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! T
    }
    
    func toggleBtn(_ btn: UIButton, _ enable: Bool) {
        btn.isEnabled = enable
        btn.alpha = enable ? 1.0 : 0.5
    }
}
