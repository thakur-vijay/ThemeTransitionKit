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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.1.0/ThemeTransitionKit.xcframework.zip",
            checksum: "14d5941040ac5d4061720971f99a42cadb9c0ed379924d7ede3720fc320cd4de"
        )
    ],

    swiftLanguageModes: [.v6]
)
