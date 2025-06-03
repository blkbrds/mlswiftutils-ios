//
//  BoolTests.swift
//  SwiftUtils
//
//  Created by DaoNV on 6/6/16.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class BoolTests: XCTestCase {

    func test_toggle() {
        var bool = true
        bool.toggle()
        XCTAssertFalse(bool)
    }
}
