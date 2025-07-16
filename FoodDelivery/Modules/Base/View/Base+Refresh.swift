//
//  Base+Refresh.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import UIKit

extension BaseController {
    
    func setupRefreshTable() -> UIRefreshControl? {
        refreshTable = UIRefreshControl()
        refreshTable?.tintColor = .clear
        return refreshTable
    }
    
    func endRefresherTable() {
        if refreshTable?.isRefreshing ?? false {
            refreshTable?.endRefreshing()
        }
    }
    
    func setupRefreshCollection() -> UIRefreshControl? {
        refreshCollection = UIRefreshControl()
        refreshCollection?.tintColor = .clear
        return refreshCollection
    }
    
    func endRefresherCollection() {
        if refreshCollection?.isRefreshing ?? false {
            refreshCollection?.endRefreshing()
        }
    }    
}
