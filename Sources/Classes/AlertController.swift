//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

public enum AlertLevel: Int {
    case low
    case normal
    case high
    case require
}

public protocol AlertLevelProtocol: AnyObject {
    var level: AlertLevel { get }
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

open class AlertController: UIAlertController, AlertLevelProtocol {

    open var level = AlertLevel.normal

    // Recommend `present` method for AlertController instead of default is `presentViewController`.
    open func present(from: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        if let from = from, from.isViewLoaded {
            if let popup = from.presentedViewController {
                if let vc = popup as? AlertLevelProtocol {
                    if level > vc.level {
                        vc.dismiss(animated: animated, completion: {
                            self.present(from: from, animated: animated, completion: completion)
                        })
                    }
                } else if level > .normal {
                    popup.dismiss(animated: animated, completion: {
                        self.present(from: from, animated: animated, completion: completion)
                    })
                }
            } else {
                from.present(self, animated: animated, completion: completion)
            }
        } else if let root = UIApplication.shared.delegate?.window??.rootViewController, root.isViewLoaded {
            present(from: root, animated: animated, completion: completion)
        }
    }

    open func dismiss(_ animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
}

public func == (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

public func > (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue > rhs.rawValue
}

public func >= (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

public func < (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <= (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}
