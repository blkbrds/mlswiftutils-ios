//
//  Range.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 10/9/15.
//  Copyright © 2025 ML. All rights reserved.
//

import UIKit

extension Range {

    public static func random(from min: Int, to max: Int) -> ClosedRange<Int> {
        let lowerBound = Int.random(min: min, max: max)
        let upperBound = Int.random(min: lowerBound, max: max)
        return lowerBound...upperBound
    }
}
