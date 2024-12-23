// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MVCFlow",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "MVCFlow",
            targets: ["MVCFlow"])
    ],
    dependencies: [
        .package(path: "../../../Feature/Cart"),
        .package(path: "../../../Middle/Library")
    ],
    targets: [
        .target(
            name: "MVCFlow",
            dependencies: ["Cart", "Library"]
        ),
        .testTarget(
            name: "MVCFlowTests",
            dependencies: [
                "MVCFlow",
                .product(name: "LibraryTestSupport",
                         package: "Library")
            ])
    ]
)
