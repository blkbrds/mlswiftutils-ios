//
//  BoolTests.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 6/6/16.
//  Copyright © 2025 ML. All rights reserved.
//

import XCTest
@testable import MLSwiftUtils

class BoolTests: XCTestCase {

    func test_toggle() {
        var bool = true
        bool.toggle()
        XCTAssertFalse(bool)
    }
}
