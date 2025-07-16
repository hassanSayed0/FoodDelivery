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
    
    func createBlurredView() -> UIView {
        let containerView = UIView()
        let blurEffect = UIBlurEffect(style: .extraLight)
        let customBlurEffectView = CustomVisualEffectView(effect: blurEffect, intensity: 0.1)
        customBlurEffectView.frame = view.bounds
        let dimmedView = UIView()
        dimmedView.backgroundColor = .black.withAlphaComponent(0.1)
        dimmedView.frame = view.bounds
        containerView.addSubview(customBlurEffectView)
        containerView.addSubview(dimmedView)
        return containerView
    }
    
    func setupBlur(viewBlur: UIView) {
        self.view.backgroundColor = UIColor.clear
        view.addSubview(viewBlur)
        view.sendSubviewToBack(viewBlur)
    }
    
    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
        (navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    /**
     Adds a view controller as a child
     
     - parameter viewController: The view controller
     - parameter toView:         The view to add the view controller's view (default: self.view)
     */
    public func addChild(viewController: UIViewController, toView: UIView? = nil) {
        let view: UIView = toView ?? self.view
        self.addChild(viewController)
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    /**
     Removes a view controller from the hierarchy
     */
    public func removeFromParentViewController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func setTitleAsImage() {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func pushFromTop() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromBottom
        self.navigationController?.view.layer.add(transition, forKey: nil)
    }
    
    func pushFromBottom() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
    }
    
    func popFromTop() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.navigationController?.view.layer.add(transition, forKey: nil)
    }
    
    func popFromBottom() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
    }
    
    func setStatusBar(_ color: UIColor) {
//        let statusBar = UIView(frame: UIWindow.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
//        statusBar.backgroundColor = color
//        statusBar.tag = 100
//        self.view.addSubview(statusBar)
    }
    

    static func loadView<T: UIViewController>(storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let identifier = String(describing: T.self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Could not instantiate view controller with identifier \(identifier) from storyboard \(storyboardName)")
        }
        return viewController
    }
    

    func fadeInBackground(_ view: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            view.alpha = 0.2
            view.alpha = 0.4
            view.alpha = 0.6
        }, completion: nil)
    }
    
    func fadeOutBackground(_ view: UIView) {
        view.alpha = 0
    }
    
    // MARK: - SET BACKGROUND COLOR OF STATUS BAR
    
    func setBackgroundColorOfStatusBar(barColor: UIColor) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height ?? 0
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: statusBarHeight))
        statusBarView.backgroundColor = barColor
        view.addSubview(statusBarView)
    }
    
    func hideTabBar(state: Bool) {
        tabBarController?.tabBar.isHidden = state
    }
    
}
