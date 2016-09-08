//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

public enum AlertLevel: Int {
    case Low
    case Normal
    case High
    case Require
}

public class AlertController: UIAlertController {
    public var level = AlertLevel.Normal

    public static func create(title: String, message: String, level: AlertLevel = .Normal, preferredStyle: UIAlertControllerStyle = .Alert) -> AlertController {
        let alert = AlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.level = level
        
        return alert
    }
    
    public func addAction(title: String?, style: UIAlertActionStyle = UIAlertActionStyle.Default, handler: (() -> Void)? = nil) -> AlertController {
        let actionHandler: ((UIAlertAction) -> Void)? = handler != nil ? { (action: UIAlertAction) -> Void in
            handler?()
        }: nil
        addAction(UIAlertAction(title: title, style: style, handler: actionHandler))
        
        return self
    }

    // Recommend `present` method for AlertController instead of default is `presentViewController`.
    public func present(from from: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        if let from = from where from.isViewLoaded() {
            if let popup = from.presentedViewController {
                if let vc = popup as? AlertController {
                    if level > vc.level {
                        vc.dismissViewControllerAnimated(animated, completion: { () -> Void in
                            self.present(from: from, animated: animated, completion: completion)
                        })
                    }
                } else if level >= .Normal {
                    popup.dismissViewControllerAnimated(animated, completion: { () -> Void in
                        self.present(from: from, animated: animated, completion: completion)
                    })
                }
            } else {
                from.presentViewController(self, animated: animated, completion: completion)
            }
        } else if let root = UIApplication.sharedApplication().delegate?.window??.rootViewController where root.isViewLoaded() {
            present(from: root, animated: animated, completion: completion)
        }
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismissViewControllerAnimated(animated, completion: completion)
    }

    public class func alertWithError(error: NSError, level: AlertLevel = .Normal, handler: (() -> Void)? = nil) -> AlertController {
        let alert = AlertController(
            title: NSBundle.mainBundle().name.localized(),
            message: error.localizedDescription.localized(),
            preferredStyle: .Alert
        )
        alert.addAction("OK".localized(), style: .Cancel, handler: handler)
        return alert
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

