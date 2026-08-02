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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.1.3/ThemeTransitionKit.xcframework.zip",
            checksum: "0ea47ee4cf8094b06cbfffbb935e9524eb2d7ff32b9ef80e2d6d528152aedec4"
        )
    ],

    swiftLanguageModes: [.v6]
)
