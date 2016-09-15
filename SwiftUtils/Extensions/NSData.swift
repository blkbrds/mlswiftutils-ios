//
//  NSData.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension Data {
    public func toJSON() -> AnyObject? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            return nil
        }
    }

    public func toString(_ encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
}
