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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.7/ThemeTransitionKit.xcframework.zip",
            checksum: "f25c0f91d6c9b97d5b3fd573433c652ff397bc7b8dc5de31e825c092da74d380"
        )
    ],

    swiftLanguageModes: [.v6]
)
