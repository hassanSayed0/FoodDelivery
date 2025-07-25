//
//  BlurView.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 16/07/2025.
//

import UIKit

final class CustomVisualEffectView: UIVisualEffectView {
   
   private let theEffect: UIVisualEffect
   private let customIntensity: CGFloat
   private var animator: UIViewPropertyAnimator?
   
    init(effect: UIVisualEffect, intensity: CGFloat) {
        theEffect = effect
        customIntensity = intensity
        super.init(effect: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
    
    deinit {
        animator?.stopAnimation(true)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        effect = nil
        animator?.stopAnimation(true)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.effect = theEffect
        }
        animator?.fractionComplete = customIntensity
    }
}

