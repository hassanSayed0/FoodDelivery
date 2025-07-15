
//
//  UIView+Extensions.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner?, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners ?? UIRectCorner(), cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func conrnerRadiusRL(_ view: UIView){
//        if LOCALIZ.isEN {
            view.roundCorners([.bottomLeft, .topLeft], radius: 10)
//        } else {
//            view.roundCorners([.bottomRight, .topRight], radius: 10)
//        }
    }
    
    func conrnerRadiusDisCount(_ view: UIView,_ label: UILabel){
//        if LOCALIZ.isEN {
            view.roundCorners([.topLeft, .bottomRight], radius: 10)
            label.roundCorners([.topLeft, .bottomRight], radius: 10)
//        } else {
//            view.roundCorners([.topRight, .bottomLeft], radius: 10)
//            label.roundCorners([.topRight, .bottomLeft], radius: 10)
//        }
    }
    
    func cornerRadiusTop(_ view: UIView, _ radius: CGFloat){
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
