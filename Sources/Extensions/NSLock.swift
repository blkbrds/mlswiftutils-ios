//
//  NSLock.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 12/7/15.
//  Copyright © 2025 ML. All rights reserved.
//

import UIKit

extension NSLock {

    public func sync(_ block: () -> Void) {
        let locked = `try`()
        block()
        if locked {
            unlock()
        }
    }
}
