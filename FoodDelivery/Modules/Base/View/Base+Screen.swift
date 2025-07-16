//
//  Base+Screen.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import UIKit

// MARK: - Network Screen

extension BaseController {
    
    func showNetworkErrorScreen() {
//    func showNetworkErrorScreen(_ delegate: NetworkScreenControllerDelegate?, _ view: UIView) {
//        isNetworkScreenPresented = true
//        NETWORKSCREEN.delegate = delegate
//        NETWORKSCREEN.showAsSubView(view)
//        if isEmptyScreenPresented ?? false {
//            closeEmptyScreen()
//        }
    }
    
    func closeNetworkErrorScreen() {
        if isNetworkScreenPresented == true {
            isNetworkScreenPresented = nil
//            NETWORKSCREEN.close()
        }
    }
    
    func checkNetworkError(_ apiFunction: () -> Void) {
        if isNetworkScreenPresented ?? false  {
            apiFunction()
        }
    }
}

// MARK: - Empty Screen

extension BaseController {
    
    func showEmptyScreen() {
//    func showEmptyScreen(_ type: ScreensType, delegate: EmptyScreenControllerDelegate? = nil, view: UIView, frame: UIView? = nil) {
//        DispatchQueue.main.async { [self] in
//            guard !(isNetworkScreenPresented ?? false) else { return }
//            isEmptyScreenPresented = true
//            EMPTYSCREEN.delegate = delegate
//            EMPTYSCREEN.type = type
//            EMPTYSCREEN.showAsSubView(view, frame)
//        }
    }
    
    func closeEmptyScreen() {
//        DispatchQueue.main.async { [self] in
//            if isEmptyScreenPresented == true {
//                isEmptyScreenPresented = nil
//                EMPTYSCREEN.close()
//            }
//        }
    }
    
    func checkEmptyScreen(_ apiFunction: () -> Void) {
        if isEmptyScreenPresented ?? false  {
            apiFunction()
        }
    }
    
    
}

// MARK: - Refresher Screen

extension BaseController {
    
    func showRefresher(view: UIView, isBtnLoading: Bool = false, frame: UIView? = nil, background: UIColor = .white) {
        isloading = true
//        REFRESHERSCREEN.showAsSubView(view, isBtnLoading, frame, background)
    }
    
    func hideRefresher() {
        endRefresherTable()
        endRefresherCollection()
//        REFRESHERSCREEN.close()
        isloading = nil
    }
    
    func checkLoading(_ loadingFunction: () -> Void) {
        guard isloading == true else { return }
        loadingFunction()
    }
    
}
