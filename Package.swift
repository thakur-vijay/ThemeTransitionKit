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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.4/ThemeTransitionKit.xcframework.zip",
            checksum: "f4131def6e9767f3f25036a245867193fd70e6ae099f2f1511da9528ffdfefca"
        )
    ],

    swiftLanguageModes: [.v6]
)
