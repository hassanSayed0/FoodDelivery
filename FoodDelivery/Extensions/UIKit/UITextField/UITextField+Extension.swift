//
//  UITextField+Extension.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 17/07/2025.
//

import UIKit

extension UITextField {
    
    @IBInspectable var kLeftView: UIImage? {
        get {
            if let img = leftView?.subviews.first as? UIImageView {
                return img.image
            } else {
                return nil
            }
        }
        set {
            let width: CGFloat = 35
            let height: CGFloat = 20
            let y = (frame.height - height) / 2
            let view = UIView(frame: CGRect(x: 10, y: y, width: width, height: height))
            let iconImageView = UIImageView(image: newValue)
            iconImageView.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
            iconImageView.contentMode = .scaleAspectFit
            view.addSubview(iconImageView)
            leftView = view
            leftViewMode = .always
        }
    }
    
    @IBInspectable var kRightView: UIImage? {
        get {
            if let img = rightView?.subviews.first as? UIImageView {
                return img.image
            } else {
                return nil
            }
        }
        set {
            let width: CGFloat = 35
            let height: CGFloat = 20
            let y = (frame.height - height) / 2
            let view = UIView(frame: CGRect(x: 10, y: y, width: width, height: height))
            let iconImageView = UIImageView(image: newValue)
            iconImageView.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
            iconImageView.contentMode = .scaleAspectFit
            view.addSubview(iconImageView)
            rightView = view
            rightViewMode = .always
        }
    }
    
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let text = attributedPlaceholder?.string else { return }
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        }
    }
    
    func checkSecurity() {
        if isSecureTextEntry {
            let tempText = text
            text = nil
            insertText(tempText ?? "")
        }
    }
    
    func localize() {
        self.textAlignment = (LOCALIZ.getLanguage() == Language.EN.rawValue ? .left : .right)
    }
    
    func setPlaceHolder(_ title: String = "", _ font: UIFont = UIFont(name: AppFontName.robotoRegular, size: 16)!, _ color: UIColor = .black) {
        self.attributedPlaceholder = NSAttributedString(string: title,attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
    }
    
    func checkMaxLength() {
        if self.text?.count ?? 0 > self.maxLength {
            self.text = String(self.text!.prefix(self.maxLength) )
        }
    }

}

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}
