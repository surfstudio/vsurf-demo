// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VSURFState",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "VSURFState",
            targets: ["VSURFState"])
    ],
    dependencies: [
        .package(path: "../../../Feature/Cart"),
        .package(path: "../../../Core/Core"),
        .package(path: "../../../Middle/Storages")
    ],
    targets: [
        .target(
            name: "VSURFState",
            dependencies: ["Cart", "Storages"]
        ),
        .testTarget(
            name: "VSURFStateTests",
            dependencies: [
                "VSURFState",
                .product(name: "CoreTestSupport",
                         package: "Core")
            ])
    ]
)
