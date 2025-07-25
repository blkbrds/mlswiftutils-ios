//
//  Float.swift
//  MLSwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

extension Float {

    public var abs: Float {
        return Foundation.fabsf(self)
    }

    public var sqrt: Float {
        return Foundation.sqrt(self)
    }

    public var floor: Float {
        return Foundation.floor(self)
    }

    public var ceil: Float {
        return Foundation.ceil(self)
    }

    public var round: Float {
        return Foundation.round(self)
    }

    public func clamp(_ min: Float, _ max: Float) -> Float {
        return Swift.max(min, Swift.min(max, self))
    }

    public static func random(min: Float = 0, max: Float) -> Float {
        return Float.random(in: min...max)
    }

    public func distance(_ precision: Int = -1) -> String { // precision < 0: Auto
        var num = self
        var unit = "m"
        if num > 1000.0 {
            unit = "km"
            num /= 1000.0
        }
        if precision == -1 {
            if num == truncf(num) {
                return String(format: "%.0f%@", num, unit)
            } else {
                return String(format: "%.1f%@", num, unit)
            }
        } else {
            let format = "%.\(precision)f%@"
            return String(format: format, num, unit)
        }
    }
}
