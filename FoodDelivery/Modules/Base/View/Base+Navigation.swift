//
//  Base+Navigation.swift
//  Done
//
//  Created by MhMuD SalAh on 15/09/2023.
//  Copyright © 2023 MhMuD SalAh. All rights reserved.
//

import UIKit

extension BaseController {
    
    func hideNavigationBorder() {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func hideNavigationBar(_ hide: Bool) {
        navigationController?.setNavigationBarHidden(hide, animated: false)
    }
    
    func hideNavigationBarShadow(_ hide: Bool) {
        navigationController?.navigationBar.layer.shadowOpacity = hide ? 0 : 0.40
    }
    
    func setupBackNavigation() {
        guard navigationController?.viewControllers.count ?? 0 > 1 else { return }
        customBarButton(.back, .left)
    }
    
    func setupNavigationTitle(_ title: String?) {
        let titleLabel = UILabel()
//        titleLabel.text = title?.localized
//        titleLabel.textAlignment = .center
//        titleLabel.textColor = .textBlackApp
//        titleLabel.font = UIFont.mediumFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
    func setNavigationTitle(_ title: String, _ direction: BarDirection) {
        let lblTitle = UILabel()
//        lblTitle.text = title.localized
//        lblTitle.font = UIFont.mediumFont(ofSize: 20)
        lblTitle.textColor = .red
        setDirection(false, direction, lblTitle)
    }
    
    func customBarButton(_ type: BarBtnType, _ direction: BarDirection) {
        let button = UIButton.init(type: .custom)
        setFrameBarBtn(type, button)
        setImageBarBtn(type, button)
        setActionBarBtn(type, button)
        setDirection(true, direction, button)
    }
    
    func setFrameBarBtn(_ type: BarBtnType, _ button: UIButton) {
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
//        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func setImageBarBtn(_ type: BarBtnType, _ button: UIButton) {
        switch type {
        case .back:
            button.setImage(UIImage(named: "back"), for: .normal)
//            if LOCALIZ.isAR {
//                button.transform = CGAffineTransform(scaleX: -1, y: 1)
//            }
        case .search:
            button.setImage(UIImage(named: "search-navigation"), for: .normal)
        default: break
//            button.setTitle("delete_account".localized, for: .normal)
//            button.setTitleColor(.primaryRed, for: .normal)
//            button.titleLabel?.font =  UIFont(name: AppFontName.robotoMedium, size: 14)
        }
        
    }
    
    func setDirection(_ isBack: Bool, _ direction: BarDirection, _ customView: UIView) {
        switch direction {
        case .left:
            if navigationItem.leftBarButtonItems?.isEmpty ?? true {
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
            } else {
                navigationItem.leftBarButtonItems?.insert(UIBarButtonItem(customView: customView), at: isBack ? 0 : navigationItem.leftBarButtonItems!.count)
            }
        case .right:
            if navigationItem.rightBarButtonItems?.isEmpty ?? true {
                navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customView)
            } else {
                navigationItem.rightBarButtonItems?.insert(UIBarButtonItem(customView: customView), at: isBack ? 0 : navigationItem.rightBarButtonItems!.count)
            }
        }
    }
    
    func setActionBarBtn(_ type: BarBtnType, _ button: UIButton) {
        switch type {
        case .back:
            button.addTarget(self, action: #selector(popViewAction), for: .touchUpInside)
        case .search:
            button.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        default:
            button.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        }
    }
    
    @objc private func popViewAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func presentSearch() {
        
    }

}
