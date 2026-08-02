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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.9/ThemeTransitionKit.xcframework.zip",
            checksum: "8b512a272072c413f657f3d993ee91d4fe8f3460d26f00725b10e13a71b9b2e6"
        )
    ],

    swiftLanguageModes: [.v6]
)
