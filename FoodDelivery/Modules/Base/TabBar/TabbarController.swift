//
//  TabbarController.swift
//  Nafa7at
//
//  Created by MhMuD SalAh on 24/06/2022.
//  Copyright © 2022 MhMuD SalAh. All rights reserved.
//

import UIKit

let didChangeProductCart = Notification.Name("didChangeProductCart")

var TAB = TabBarController.shared

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    var icon1 = UITabBarItem()
    var icon2 = UITabBarItem()
    var icon3 = UITabBarItem()
    var icon4 = UITabBarItem()
    var icon5 = UITabBarItem()
    
    fileprivate var shouldSelectOnTabBar = true

    struct Static {
        static var instance: TabBarController?
    }
    
    class var shared: TabBarController {
        if Static.instance == nil {
            Static.instance = TabBarController()
        }
        return Static.instance!
    }
    
    func dispose() {
        TabBarController.Static.instance = nil
    }
    
    open override var selectedViewController: UIViewController? {
        willSet {
            guard shouldSelectOnTabBar,
                  let newValue = newValue else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? BubbleTabBar, let index = viewControllers?.firstIndex(of: newValue) else {
                return
            }
            tabBar.select(itemAt: index, animated: false)
        }
    }

    open override var selectedIndex: Int {
        willSet {
            guard shouldSelectOnTabBar else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? BubbleTabBar else {
                return
            }
            tabBar.select(itemAt: selectedIndex, animated: false)
        }
    }
    
    open var barHeight: CGFloat {
        get {
            return 74 + view.safeAreaInsets.bottom
        }
        set {
            updateTabBarFrame()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
        
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTabBarFrame()
    }

    open override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        updateTabBarFrame()
    }

    // MARK: - TAB BAR SHADOW
    
    func setupTabBar() {
        let tabBar = BubbleTabBar()
        self.setValue(tabBar, forKey: "tabBar")
        delegate = self
        tabBar.tintColor = .primaryDark
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 1, height: -1)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 2
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        setupTabBarAttributes(appearance)
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance
        //tabBar
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    // MARK: - TAB BAR ATTRIBUTES
    
    func setupTabBarAttributes(_ appearance: UITabBarAppearance) {
        let font = UIFont(name: AppFontName.robotoBold, size: 13)!
        let normalAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.primaryLight]
        let selectedAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.primaryDark]
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.stackedLayoutAppearance.normal.iconColor = .primaryLight
        appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .primaryDark
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        
        appearance.stackedLayoutAppearance.selected.iconColor = .primaryDark
        appearance.stackedLayoutAppearance.selected.badgeBackgroundColor = .primaryDark
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
    }
        
    private func updateTabBarFrame() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = barHeight
        tabFrame.origin.y = view.frame.size.height - barHeight
        tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
    }

    // MARK: - TAB BAR CONTROLLERS
    
    private func setupView() {
//        let item1 = HomeRouter.assembleModule()
//        let item2 = FavoritesRouter.assembleModule()
//        let item3 = StoreRouter.assembleStoreModule()
//        let item4 = NotificationsRouter.assembleModule()
//        let item5 = ProfileRouter.assembleModule()
        let item1 = UIViewController()
        let item2 = UIViewController()
        let item3 = UIViewController()
        let item4 = UIViewController()
        let item5 = UIViewController()
        
        icon1 = UITabBarItem(title: "home".localized, image: UIImage(named: "home-tab-off"), selectedImage: UIImage(named: "home-tab-on"))
        icon2 = UITabBarItem(title: "favorites".localized, image: UIImage(named: "favorites-tab-off"), selectedImage: UIImage(named: "favorites-tab-on"))
        icon3 = UITabBarItem(title: "stores".localized, image: UIImage(named: "stores-tab-off"), selectedImage: UIImage(named: "stores-tab-on"))
        icon4 = UITabBarItem(title: "notifications".localized, image: UIImage(named: "notification-tab-off"), selectedImage: UIImage(named: "notification-tab-on"))
        icon5 = UITabBarItem(title: "profile".localized, image: UIImage(named: "profile-tab-off"), selectedImage: UIImage(named: "profile-tab-on"))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        item5.tabBarItem = icon5
        
        var controllers = [UIViewController()]
        controllers = [item1, item2, item3, item4,item5]
        self.viewControllers = controllers
        
        self.icon3.badgeValue = "\(5)"
        self.icon3.badgeColor = .primaryDark
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else { return }
        if let controller = viewControllers?[index] {
            shouldSelectOnTabBar = false
            selectedIndex = index
            delegate?.tabBarController?(self, didSelect: controller)
        }
    }
}
