//
//  Tabbar+Customizing.swift
//  Nafahat
//
//  Created by MhMuD SalAh on 29/06/2022.
//  Copyright © 2022 MhMuD SalAh. All rights reserved.
//

import UIKit

open class BubbleTabBar: UITabBar {
    
    private var buttons: [TabBarButton] = []
    public var animationDuration: Double = 0.3
    private var csContainerBottom: NSLayoutConstraint!
    private var spaceLayoutGuides:[UILayoutGuide] = []
    
    open override var selectedItem: UITabBarItem? {
        willSet {
            guard let newValue = newValue else {
                buttons.forEach { $0.setSelected(false) }
                return
            }
            guard let index = items?.firstIndex(of: newValue),
                index != NSNotFound else {
                    return
            }
            select(itemAt: index, animated: false)
        }
    }
        
    open override var tintColor: UIColor! {
        didSet {
            buttons.forEach { button in
            button.tintColor = tintColor
            }
        }
    }
    
    override open var backgroundColor: UIColor? {
        didSet {
            barTintColor = backgroundColor
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        observerCarts()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        observerCarts()
    }
    
    var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private func configure() {
        backgroundColor = UIColor.white
        isTranslucent = false
        barTintColor = UIColor.white
        tintColor = .primaryLight
        addSubview(container)
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        let bottomOffset: CGFloat
        bottomOffset = safeAreaInsets.bottom
        csContainerBottom = container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomOffset)
        csContainerBottom.isActive = true
    }
    
    override open func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        csContainerBottom.constant = -safeAreaInsets.bottom
    }
    
    open override var items: [UITabBarItem]? {
        didSet {
            reloadViews()
        }
    }
    
    open override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        super.setItems(items, animated: animated)
        reloadViews()
    }
    
    private func reloadViews() {
        subviews.filter { String(describing: type(of: $0)) == "UITabBarButton" }.forEach { $0.removeFromSuperview() }
        buttons.forEach { $0.removeFromSuperview() }
        spaceLayoutGuides.forEach { self.container.removeLayoutGuide($0) }
        buttons = items?.map { self.button(forItem: $0) } ?? []
        buttons.forEach { (button) in
            self.container.addSubview(button)
            button.topAnchor.constraint(equalTo: self.container.topAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: self.container.bottomAnchor).isActive = true
        }
        buttons.first?.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10.0).isActive = true
        buttons.last?.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10.0).isActive = true
        let viewCount = buttons.count - 1
        spaceLayoutGuides = [];
        for i in 0..<viewCount {
            let layoutGuide = UILayoutGuide()
            container.addLayoutGuide(layoutGuide)
            spaceLayoutGuides.append(layoutGuide)
            let prevBtn = buttons[i]
            let nextBtn = buttons[i + 1]
            layoutGuide.leadingAnchor.constraint(equalTo: prevBtn.trailingAnchor).isActive = true
            layoutGuide.trailingAnchor.constraint(equalTo: nextBtn.leadingAnchor).isActive = true
        }
        for layoutGuide in spaceLayoutGuides[1...] {
            layoutGuide.widthAnchor.constraint(equalTo: spaceLayoutGuides[0].widthAnchor, multiplier: 1.0).isActive = true;
        }
        layoutIfNeeded()
    }
    
    private func button(forItem item: UITabBarItem) -> TabBarButton {
        let button = TabBarButton(item: item)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        if selectedItem != nil && item === selectedItem {
            button.setSelected(true)
        }
        return button
    }
    
    @objc private func btnPressed(sender: TabBarButton) {
        guard let index = buttons.firstIndex(of: sender),
            index != NSNotFound,
            let item = items?[index] else {
                return
        }
        buttons.forEach { (button) in
            guard button != sender else {
                return
            }
            button.setSelected(false, animationDuration: animationDuration)
        }
        sender.setSelected(true, animationDuration: animationDuration)
        UIView.animate(withDuration: animationDuration) {
            self.container.layoutIfNeeded()
        }
        delegate?.tabBar?(self, didSelect: item)
    }
    
    func select(itemAt index: Int, animated: Bool = false) {
        guard index < buttons.count else {
            return
        }
        let selectedbutton = buttons[index]
        buttons.forEach { (button) in
            guard button != selectedbutton else {
                return
            }
            button.setSelected(false, animationDuration: animated ? animationDuration : 0)
        }
        selectedbutton.setSelected(true, animationDuration: animated ? animationDuration : 0)
        if animated {
            UIView.animate(withDuration: animationDuration) {
                self.container.layoutIfNeeded()
            }
        } else {
            self.container.layoutIfNeeded()
        }
    }
    
    func observerCarts() {
//        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(notification:)), name: Notification.Name(CART.NOTIFICATION_CENTER_CART_COUNT_ID), object: nil)
    }
    
    @objc func receivedNotification(notification: Notification) {
        if let cartsCount = notification.object as? Int {
            if cartsCount == 0 {
                buttons[2].viewBadge.alpha = 0
            } else {
                buttons[2].viewBadge.alpha = 1
                buttons[2].lblBadge.text = "\(cartsCount)"
            }
        }
    }

}
