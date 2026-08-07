[MLSwiftUtils](https://github.com/blkbrds/mlswiftutils-ios)
============

## Requirements

- iOS 14.0+
Version 5.1.1: - Xcode 16 ~ Swift 5.0+

## Installation

### Swift Package Manager

In Xcode, choose `File > Add Package Dependencies...` and enter the repository URL:

```
https://github.com/blkbrds/mlswiftutils-ios.git
```

Or add it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/blkbrds/mlswiftutils-ios.git", from: "5.1.1")
]
```

Then add `MLSwiftUtils` to the target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: ["MLSwiftUtils"]
)
```

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.
You can install it with the following command:

```bash
$ gem install cocoapods
```


To integrate MLSwiftUtils into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '14.0'
use_frameworks!

pod 'MLSwiftUtils', '5.1.1'
```

Then, run the following command:

```bash
$ pod install
```
