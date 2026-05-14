//
//  CacheHelper.swift
//  MLSwiftUtils
//
//  Created by Huy Vo D. [2] VN.Danang on 13/5/26.
//  Copyright © 2026 ML. All rights reserved.
//

import Foundation
import WebKit

public final class CacheHelper {

    // MARK: - Singleton

    public static let shared = CacheHelper()

    // MARK: - Constants

    private enum Keys {
        static let lastCacheCleanupDate = "com.MLSwiftUtils.lastCacheCleanupDate"
    }

    // MARK: - Properties

    private let userDefaults = UserDefaults.standard

    private init() {}

    // MARK: - Public

    /// Clears the app's `.cachesDirectory` if enough days have passed
    /// since the last cleanup.
    ///
    /// Recommended to call in:
    /// `application(_:didFinishLaunchingWithOptions:)`
    ///
    /// - Parameter minimumDaysBetweenClears:
    ///   Minimum number of days between cleanups.
    public func clearCachesDirectoryIfNeeded(minimumDaysBetweenClears: Int = 7) {
        guard shouldClearCache(minimumDaysBetweenClears: minimumDaysBetweenClears) else {
            return
        }
        saveLastCleanupDate()
        DispatchQueue.global(qos: .background).async {
            let fileManager = FileManager.default
            guard let cachesURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
                return
            }
            do {
                let contentURLs = try fileManager.contentsOfDirectory(
                    at: cachesURL,
                    includingPropertiesForKeys: nil
                )
                for url in contentURLs {
                    try fileManager.removeItem(at: url)
                }
            } catch {
                debugPrint(
                    "CacheHelper - Error clearing caches directory: \(error)"
                )
            }
        }
    }

    /// Clears all `WKWebView` website data if enough days have passed
    /// since the last cleanup.
    ///
    /// Recommended to call in:
    /// `application(_:willFinishLaunchingWithOptions:)`
    ///
    /// - Parameter minimumDaysBetweenClears:
    ///   Minimum number of days between cleanups.
    public func clearWebsiteDataIfNeeded(minimumDaysBetweenClears: Int = 7) {
        guard shouldClearCache(minimumDaysBetweenClears: minimumDaysBetweenClears) else {
            return
        }
        saveLastCleanupDate()
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: .distantPast) {}
    }

    // MARK: - Private
    private func shouldClearCache(minimumDaysBetweenClears: Int) -> Bool {
        guard let lastClearedDate = userDefaults.object(forKey: Keys.lastCacheCleanupDate) as? Date else {
            // First launch -> save date and skip cleanup
            saveLastCleanupDate()
            return false
        }
        let daysSinceLastClear = Calendar.current.dateComponents(
            [.day],
            from: lastClearedDate,
            to: Date()
        ).day ?? 0
        return daysSinceLastClear >= minimumDaysBetweenClears
    }

    private func saveLastCleanupDate() {
        userDefaults.set(Date(), forKey: Keys.lastCacheCleanupDate)
    }
}
