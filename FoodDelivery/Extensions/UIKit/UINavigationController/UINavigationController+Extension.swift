//
//  UINavigationController+Extension.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import UIKit

extension UINavigationController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupBarAttributes()
    }
        
    func setupBarAttributes() {
        let font = UIFont(name: "system", size: 20)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 20)]
        navigationBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
