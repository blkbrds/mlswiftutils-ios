//
//  Regex.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/9/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    public class func regex(_ pattern: String, ignoreCase: Bool = false) -> NSRegularExpression? {
        let options: NSRegularExpression.Options = ignoreCase ? [.caseInsensitive]: []
        let regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            regex = nil
        }
        return regex
    }
}
