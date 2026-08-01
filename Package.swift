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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.1/ThemeTransitionKit.xcframework.zip",
            checksum: "a4217f3e6140f45e6799a74f4a3598fc87a520c2627194e6c442bb86831e1171"
        )
    ],

    swiftLanguageModes: [.v6]
)
