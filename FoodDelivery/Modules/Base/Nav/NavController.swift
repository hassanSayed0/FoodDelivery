//
//  NavController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import UIKit

var NAV = NavController.shared

class NavController: UINavigationController {
    
    static var shared: NavController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavController.shared = self
        NAV = NavController.shared
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavController.shared = self
        NAV = NavController.shared
    }
}
