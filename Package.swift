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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.2/ThemeTransitionKit.xcframework.zip",
            checksum: "fd83fb2efb6fdde43725eb2a4d789cd0ad0fc2a00ac4f7495a4586e461c598c8"
        )
    ],

    swiftLanguageModes: [.v6]
)
