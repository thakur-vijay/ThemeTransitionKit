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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.1.1/ThemeTransitionKit.xcframework.zip",
            checksum: "f0ab66e73e8ef6a8fb5a61d1afe76f165c8477686eee00a4954ea8bfdc3c5e6e"
        )
    ],

    swiftLanguageModes: [.v6]
)
