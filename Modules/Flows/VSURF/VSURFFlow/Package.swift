// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VSURFFlow",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "VSURFFlow",
            targets: ["VSURFFlow"])
    ],
    dependencies: [
        .package(path: "../VSURFState"),
        .package(path: "../../../Middle/Library")
    ],
    targets: [
        .target(
            name: "VSURFFlow",
            dependencies: ["Library", "VSURFState"]
        ),
        .testTarget(
            name: "VSURFFlowTests",
            dependencies: [
                "VSURFFlow",
                .product(name: "LibraryTestSupport",
                         package: "Library")
            ])
    ]
)
