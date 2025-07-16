//
//  BaseController.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    internal var refreshTable: UIRefreshControl?
    internal var refreshCollection: UIRefreshControl?
    internal var isNetworkScreenPresented: Bool?
    internal var isEmptyScreenPresented: Bool?
    internal var isloading: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBarShadow(false) 
        setupBackNavigation()
    }
    
    func setupNavApperance(color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.shadowImage = UIImage()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = color

        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
        
}
