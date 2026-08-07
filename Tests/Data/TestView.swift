//
//  TestView.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 9/4/16.
//  Copyright © 2025 ML. All rights reserved.
//

import UIKit

// `@objc(TestView)` giữ tên runtime không phụ thuộc module, để `TestView.xib`
// nạp được cả khi build bằng SwiftPM (module name khác với target của xcodeproj).
@objc(TestView)
class TestView: UIView { }
