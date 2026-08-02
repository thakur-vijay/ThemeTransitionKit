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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.1.4/ThemeTransitionKit.xcframework.zip",
            checksum: "dac5ed3e9a3b8a1a1e7da5b10da64f2e71d4d3bd619a8d421cb4be14798b4bdf"
        )
    ],

    swiftLanguageModes: [.v6]
)
