//
//  Optional.swift
//  MLSwiftUtils
//
//  Created by Dai Ho V. VN.Danang on 17/6/25.
//  Copyright © 2025 ML. All rights reserved.
//

import Foundation

extension Optional {

    public func unwrapped(_ defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
}
