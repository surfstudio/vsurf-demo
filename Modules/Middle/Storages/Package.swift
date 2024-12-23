// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storages",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Storages",
            targets: ["Storages"])
    ],
    dependencies: [
        .package(path: "../../Core/Core"),
        .package(path: "../../Core/Models")
    ],
    targets: [
        .target(
            name: "Storages",
            dependencies: [
                "Models"
            ],
            swiftSettings: [.define("MOCKING", .when(configuration: .debug))]
        ),
        .testTarget(
            name: "StoragesTests",
            dependencies: [
                "Storages",
                .product(name: "CoreTestSupport",
                         package: "Core")
            ])
    ]
)
