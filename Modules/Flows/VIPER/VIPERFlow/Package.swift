// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VIPERFlow",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "VIPERFlow",
            targets: ["VIPERFlow"])
    ],
    dependencies: [
        .package(path: "../../../Feature/Cart"),
        .package(path: "../../../Middle/Library")
    ],
    targets: [
        .target(
            name: "VIPERFlow",
            dependencies: ["Cart", "Library"]
        ),
        .testTarget(
            name: "VIPERFlowTests",
            dependencies: [
                "VIPERFlow",
                .product(name: "LibraryTestSupport",
                         package: "Library")
            ])
    ]
)
