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
            url: "https://github.com/thakur-vijay/ThemeTransitionKit/releases/download/1.0.8/ThemeTransitionKit.xcframework.zip",
            checksum: "5692fe43a699a279bcc169c032a5d3e5d6f165b608d8b38e9f20db17868f755c"
        )
    ],

    swiftLanguageModes: [.v6]
)
