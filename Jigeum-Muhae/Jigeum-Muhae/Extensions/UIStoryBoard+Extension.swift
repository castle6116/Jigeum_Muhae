//
//  UIStoryBoard+Extension.swift
//  Jigeum-Muhae
//
//  Created by 김진우 on 2022/09/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func instantiateInitialViewController(_ storyboardName: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    static func instantiateViewController(_ storyboardName: String, viewControllerId: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    
    static func viewController<T: UIViewController>(storyboardName: String, viewControllerName: String? = nil) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let viewControllerName = viewControllerName {
            return storyboard.instantiateViewController(withIdentifier: viewControllerName) as? T
        } else {
            return storyboard.instantiateInitialViewController() as? T
        }
    }
}
