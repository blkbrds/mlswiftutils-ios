//
//  UIView.swift
//  SwiftUtils
//
//  Created by DaoNV on 9/4/16.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class UIViewTests: XCTestCase {

    func test_loadNib() {
        let xib: TestView = TestView.loadNib()
        XCTAssertNotNil(xib)
    }
}
