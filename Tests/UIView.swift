//
//  UIView.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 9/4/16.
//  Copyright © 2025 ML. All rights reserved.
//

import XCTest
@testable import MLSwiftUtils

class UIViewTests: XCTestCase {

    func test_loadNib() {
        let xib: TestView = TestView.loadNib()
        XCTAssertNotNil(xib)
    }
}
