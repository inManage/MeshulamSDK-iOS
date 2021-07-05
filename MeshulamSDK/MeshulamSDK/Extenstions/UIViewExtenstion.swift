//
//  UIViewExtenstion.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import UIKit

@IBDesignable extension UIView {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    func anchorAll(toView parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let yAxisAnchor = UIApplication.shared.keyWindow!.topAnchor
        
        let constraints: [NSLayoutConstraint] = [self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                                                 self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
                                                 self.topAnchor.constraint(equalTo: yAxisAnchor),
                                                 self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)]
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
