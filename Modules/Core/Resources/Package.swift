// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Resources",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Resources",
            targets: ["Resources"])
    ],
    dependencies: [
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "Resources",
            dependencies: ["Core"],
            resources: [
                .process("Fonts/Inter-Bold.otf"),
                .process("Fonts/Inter-Regular.otf"),
                .process("Fonts/Inter-SemiBold.otf"),
                .process("Localization")
            ]),
        .testTarget(
            name: "ResourcesTests",
            dependencies: ["Resources"])
    ]
)
