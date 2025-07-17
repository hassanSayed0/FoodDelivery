//
//  Localization+Extension.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import UIKit

// MARK: - String

public extension String {
    
    var localized: String {
        return LOCALIZ.localizedString(key: self)
    }
    
    func getLocalized(arg: CVarArg...) -> String {
        return String.init(format: self.localized, arguments: arg)
    }
}

// MARK: - UILabel

public extension UILabel {
    
    @IBInspectable
    var localizedTextKey: String {
        set { self.text = newValue.localized }
        get { return text ?? "" }
    }
}

// MARK: - UIButton

public extension UIButton {
    
    @IBInspectable
    var localizednormalTextKey: String {
        set { setTitle(newValue.localized, for: .normal) }
        get { return titleLabel?.text ?? "" }
    }
    
    @IBInspectable
    var localizedSelectedTextKey: String {
        set { setTitle(newValue.localized, for: .selected) }
        get { return titleLabel?.text ?? "" }
    }
    
    @IBInspectable
    var localizedDisableTextKey: String {
        set { setTitle(newValue.localized, for: .selected) }
        get { return titleLabel?.text ?? "" }
    }
}

// MARK: - UINavigationItem

public extension UINavigationItem {
    
    @IBInspectable
    var localizedTextKey: String {
        set { self.title = newValue.localized }
        get { return title ?? "" }
    }
}

// MARK: - UITextField

public extension UITextField {
    
    @IBInspectable
    var localizedKeyPlaceholder: String {
        set { self.placeholder = newValue.localized
            self.localize()
        }
        get { return placeholder ?? "" }
    }
}

// MARK: - UITextView

public extension UITextView {
    
    @IBInspectable
    var localizedTextKey: String {
        set { self.text = newValue.localized }
        get { return "" }
    }
}

// MARK: - UIBarButtonItem

public extension UIBarButtonItem {
    @IBInspectable
    var localizedTextKey: String {
        set { self.title = newValue.localized }
        get { return title ?? "" }
    }
}
