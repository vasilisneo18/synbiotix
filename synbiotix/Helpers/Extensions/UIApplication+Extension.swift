//
//  UIApplication+Extension.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import UIKit

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        
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
