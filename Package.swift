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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.5/ThemeTransitionKit.xcframework.zip",
            checksum: "ed6de43b53a0fc4daebef64953223f72765dfebeb3258be1f9580bbcaccbb750"
        )
    ],

    swiftLanguageModes: [.v6]
)
