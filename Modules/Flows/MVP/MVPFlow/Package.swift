// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MVPFlow",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "MVPFlow",
            targets: ["MVPFlow"])
    ],
    dependencies: [
        .package(path: "../../../Feature/Cart"),
        .package(path: "../../../Middle/Library")
    ],
    targets: [
        .target(
            name: "MVPFlow",
            dependencies: ["Cart", "Library"]
        ),
        .testTarget(
            name: "MVPFlowTests",
            dependencies: [
                "MVPFlow",
                .product(name: "LibraryTestSupport",
                         package: "Library")
            ])
    ]
)
