// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "ThemeTransitionKit",

    products: [
        .library(
            name: "ThemeTransitionKit",
            targets: ["ThemeTransitionKit"]
        ),
    ],

    targets: [
        .binaryTarget(
            name: "ThemeTransitionKit",
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.0/ThemeTransitionKit.xcframework.zip",
            checksum: "5b70952f9c597d61944f3db9e007a088759c3e8c44b9a3a63c6b78286185528c"
        )
    ],

    swiftLanguageModes: [.v6]
)
