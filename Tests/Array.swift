//
//  ArrayTests.swift
//  SwiftUtils
//
//  Created by DaoNV on 2/29/16.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class ArrayTests: XCTestCase {
    let origin: [Int] = {
        var numbers = [Int]()
        for i in 0 ... 100_000 {
            numbers.append(i)
        }
        return numbers
    }()

    func test_shuffled() {
        var shuffled: [Int]!
        self.measure { () -> Void in
            shuffled = self.origin.shuffled()
        }
        let test = { (lhs: Int, rhs: Int) -> Bool in
            return lhs < rhs
        }
        XCTAssertEqual(shuffled.sorted(by: test), origin.sorted(by: test), "sorted shuffled should equal to sorted origin")
    }

    func test_map() {
        let nilInts: [Int?] = [0, 1, nil, 3]
        let ints: [Int] = nilInts.compactMap { $0 }
        let exp: [Int] = [0, 1, 3]
        XCTAssertEqual(ints, exp)
    }
}
