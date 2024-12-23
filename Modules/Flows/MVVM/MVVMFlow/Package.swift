// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MVVMFlow",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "MVVMFlow",
            targets: ["MVVMFlow"])
    ],
    dependencies: [
        .package(path: "../../../Feature/Cart"),
        .package(path: "../../../Middle/Library")
    ],
    targets: [
        .target(
            name: "MVVMFlow",
            dependencies: ["Cart", "Library"]
        ),
        .testTarget(
            name: "MVVMFlowTests",
            dependencies: [
                "MVVMFlow",
                .product(name: "LibraryTestSupport",
                         package: "Library")
            ])
    ]
)
