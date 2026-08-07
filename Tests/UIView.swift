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
        #if SWIFT_PACKAGE
        // SwiftPM đóng gói resource vào bundle riêng thay vì bundle của test target.
        let xib: TestView = TestView.loadNib(from: .module)
        #else
        let xib: TestView = TestView.loadNib()
        #endif
        XCTAssertNotNil(xib)
    }
}
