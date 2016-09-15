//
//  String.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

extension String {
    
    public init(aClass: AnyClass) {
        let name = NSStringFromClass(aClass).components(separatedBy: ".").last!
        self.init(name)
    }

    public subscript(index: Int) -> Character? {
        let range = characters.index(startIndex, offsetBy: index)
        if range < startIndex || range > endIndex {
            return nil
        }
        return self[range]
    }

    public subscript(index: Int) -> String? {
        let range = characters.index(startIndex, offsetBy: index)
        if let char: Character = self[range] {
            return String(char)
        }
        return nil
    }

    public subscript(range: Range<Int>) -> String? {
        let start = characters.index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex)
        let end = characters.index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex)
        if start! < startIndex || end! > endIndex {
            return nil
        }
        return self[start!..<end!]
    }

    public var length: Int {
        return self.characters.count
    }

    public var capitalized: String {
        return capitalized
    }

    // Regex
    
    public func matches(_ pattern: String, ignoreCase: Bool = false) -> [NSTextCheckingResult]? {
        if let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) {
            let range = NSRange(location: 0, length: length)
            return regex.matches(in: self, options: [], range: range).map { $0 }
        }
        return nil
    }

    
    public func contains(_ pattern: String, ignoreCase: Bool = false) -> Bool {
        guard let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) else {
            return false
        }
        let range = NSRange(location: 0, length: self.characters.count)
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }

    public func replace(_ pattern: String, withString replacementString: String, ignoreCase: Bool = false) -> String? {
        if let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) {
            let range = NSRange(location: 0, length: self.characters.count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replacementString)
        }
        return nil
    }

    public func insert(_ index: Int, _ string: String) -> String {
        if index > length {
            return self + string
        } else if index < 0 {
            return string + self
        }
        return self[0 ..< index]! + string + self[index ..< length]!
    }

    public func trimmedLeft(characterSet set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: set.inverted) {
            return self[range.lowerBound ..< endIndex]
        }
        return ""
    }

    public func trimmedRight(characterSet set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: set.inverted, options: NSString.CompareOptions.backwards) {
            return self[startIndex ..< range.upperBound]
        }
        return ""
    }

    public func trimmed(characterSet set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        return trimmedLeft(characterSet: set).trimmedRight(characterSet: set)
    }

    public func trimmedLeftCJK() -> String {
        var text = self
        while text.characters.first == Character("\n") || text.characters.first == Character(" ") {
            text = text.substring(from: text.characters.index(text.startIndex, offsetBy: 1))
        }
        return text
    }

    public func trimmedRightCJK() -> String {
        var text = self
        while text.characters.last == Character("\n") || text.characters.last == Character(" ") {
            text = text.substring(to: text.characters.index(text.endIndex, offsetBy: -1))
        }
        return text
    }

    public func trimmedCJK() -> String {
        return trimmedLeftCJK().trimmedRightCJK()
    }

    public static func random(length len: Int = 0, charset: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        let len = len < 1 ? len : Int.random(max: 16)
        var result = String()
        let max = charset.length - 1
        for _ in 0 ..< len {
            result += String(charset[Int.random(min: 0, max: max)]!)
        }
        return result
    }

    public var intValue: Int {
        return Int(self) ?? 0
    }

    public var doubleValue: Double {
        return Double(self) ?? 0.0
    }

    public var floatValue: Float {
        return Float(self) ?? 0.0
    }

    public var boolValue: Bool {
        return (self as NSString).boolValue
    }

    public func replaceKeysByValues(_ values: [String: AnyObject]) -> String {
        let str: NSMutableString = NSMutableString(string: self)
        let range = NSRange(location: 0, length: str.length)
        for (key, value) in values {
            str.replaceOccurrences(of: key, with: "\(value)", options: [.caseInsensitive, .literal], range: range)
        }
        return str as NSString as String
    }

    public func stringByAppendingPathComponent(_ str: String) -> String {
        var s1: String! = self
        while s1.hasSuffix("/") {
            s1 = s1[0...s1.length - 2]
        }
        var s2: String! = str
        while s2.hasPrefix("/") {
            s2 = s2[1...length - 1]
        }
        while s2.hasSuffix("/") {
            s2 = s2[0...s2.length - 2]
        }
        return "\(s1)/\(s2)"
    }

    /// The file-system path components of the receiver. (read-only)
    public var pathComponents: [String] {
        return (self as NSString).pathComponents
    }

    /// The last path component of the receiver. (read-only)
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }

    /// The path extension, if any, of the string as interpreted as a path. (read-only)
    public var pathExtension: String {
        return (self as NSString).pathExtension
    }

    /// Initializes an NSURL object with a provided URL string. (read-only)
    public var url: URL? {
        return URL(string: self)
    }

    /// The host, conforming to RFC 1808. (read-only)
    public var host: String {
        if let url = url, let host = url.host {
            return host
        }
        return ""
    }

    // Returns a localized string, using the main bundle.
    
    public func localized(_ comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    /// Returns data with NSUTF8StringEncoding
    
    public func toData() -> Data! {
        return data(using: String.Encoding.utf8)
    }

    // MARK: Validation
    public struct Regex {
        public static let Number = "^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"
        public static let Name = "[a-zA-Z\\s]+"
        public static let Email1 = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        public static let Email2 = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        public static let Password = "[a-zA-Z0-9_]+"
        public static let URL = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    }

    public func validate(_ regex: String) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex)
        return pre.evaluate(with: self)
    }
}

extension Character {
    public var intValue: Int {
        return (String(self) as NSString).integerValue
    }
}

extension NSMutableAttributedString {
    public func appendString(_ string: String, attributes: [String: AnyObject]) {
        let attStr = NSAttributedString(string: string, attributes: attributes)
        append(attStr)
    }
}

extension NSMutableParagraphStyle {
    public class func defaultStyle() -> NSMutableParagraphStyle! {
        let style = NSMutableParagraphStyle()
        let defaultStyle = NSParagraphStyle.default
        style.lineSpacing = defaultStyle.lineSpacing
        style.paragraphSpacing = defaultStyle.paragraphSpacing
        style.alignment = defaultStyle.alignment
        style.firstLineHeadIndent = defaultStyle.firstLineHeadIndent
        style.headIndent = defaultStyle.headIndent
        style.tailIndent = defaultStyle.tailIndent
        style.lineBreakMode = defaultStyle.lineBreakMode
        style.minimumLineHeight = defaultStyle.minimumLineHeight
        style.maximumLineHeight = defaultStyle.maximumLineHeight
        style.baseWritingDirection = defaultStyle.baseWritingDirection
        style.lineHeightMultiple = defaultStyle.lineHeightMultiple
        style.paragraphSpacingBefore = defaultStyle.paragraphSpacingBefore
        style.hyphenationFactor = defaultStyle.hyphenationFactor
        style.tabStops = defaultStyle.tabStops
        style.defaultTabInterval = defaultStyle.defaultTabInterval
        return style
    }
}
