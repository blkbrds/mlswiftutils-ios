//
//  StringTests.swift
//  MLSwiftUtils
//
//  Created by Dai Ho on 7/28/16.
//  Copyright © 2025 ML. All rights reserved.
//

import XCTest
@testable import MLSwiftUtils

class StringTests: XCTestCase {

    func test_initWithClass() {
        let clazz = String(describing: UIViewController.self)
        XCTAssertEqual(clazz, "UIViewController")
    }

    func test_subscriptCharacter() {
        let str = "hello world"
        let sub: Character! = str[0]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "h")
    }

    func test_subscriptString() {
        let str = "hello world"
        let sub: String! = str[0]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "h")
    }

    func test_subscriptStringWithRange() {
        let str = "hello world"
        var sub: String!
        sub = str[0...1]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "he")
        sub = str[0...10]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "hello world")
    }

    func test_appending_path() {
        let str = "http://google.com"
        var path: String
        path = str.appending(path: "api/v3")
        XCTAssertEqual(path, "http://google.com/api/v3")
        path = str.appending(path: "/api/v3")
        XCTAssertEqual(path, "http://google.com/api/v3")
        path = str.appending(path: "/api/v3/")
        XCTAssertEqual(path, "http://google.com/api/v3")
    }

    func test_validate() {
        var email: String
        email = "supports@example.com"
        XCTAssertTrue(email.validate(String.Regex.Email2))
        email = "supports$@example.com"
        XCTAssertFalse(email.validate(String.Regex.Email2))
        email = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.com.vn"
        measure {
            XCTAssertTrue(email.validate(String.Regex.Email2))
        }
    }

    func test_trimmedLeftCJK() {
        let str = "   \n hello \n world"
        let sub = str.trimmedLeftCJK()
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "hello \n world")
    }

    func test_trimmedRightCJK() {
        let str = "hello \n world  \n  "
        let sub = str.trimmedRightCJK()
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "hello \n world")
    }
}
