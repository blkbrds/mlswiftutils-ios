// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLSwiftUtils",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MLSwiftUtils",
            targets: ["MLSwiftUtils"]
        )
    ],
    targets: [
        .target(
            name: "MLSwiftUtils",
            path: "Sources",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "MLSwiftUtilsTests",
            dependencies: ["MLSwiftUtils"],
            path: "Tests",
            exclude: ["Info.plist"],
            resources: [
                .process("Data/TestView.xib")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
