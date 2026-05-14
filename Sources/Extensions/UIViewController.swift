//
//  UIViewController.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 10/7/15.
//  Copyright © 2025 ML. All rights reserved.
//

import UIKit

extension UIViewController {

    public static func fromStoryboard(named storyboardName: String? = nil,
                                      of bundle: Bundle = Bundle.main) -> Self {
        let className = String(describing: self)
        let name = storyboardName ?? className
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        guard let vc = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("ViewController \(className) not found in storyboard \(name)")
        }
        return vc
    }
}
