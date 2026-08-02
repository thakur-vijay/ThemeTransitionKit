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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.1.2/ThemeTransitionKit.xcframework.zip",
            checksum: "f7c5469b7ea710a8d3f6d1e4d617df872f65709ee5b1c732f0e8b63bbb4facdd"
        )
    ],

    swiftLanguageModes: [.v6]
)
