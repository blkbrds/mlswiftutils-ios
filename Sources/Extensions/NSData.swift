//
//  NSData.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 12/30/15.
//  Copyright © 2025 ML. All rights reserved.
//

import Foundation

extension Data {

    public func toJSON() -> Any? {
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
