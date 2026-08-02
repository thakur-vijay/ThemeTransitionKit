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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.6/ThemeTransitionKit.xcframework.zip",
            checksum: "85752ff79e1c37691cc2f215aa744ac0986be7613c786b245057abc08274f4d3"
        )
    ],

    swiftLanguageModes: [.v6]
)
