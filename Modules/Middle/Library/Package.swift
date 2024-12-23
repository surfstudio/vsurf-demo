// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Library",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Library",
            targets: ["Library"]),
        .library(
            name: "LibraryTestSupport",
            targets: ["LibraryTestSupport"])
    ],
    dependencies: [
        .package(path: "../../Core/Core"),
        .package(path: "../../Core/Resources"),
        .package(
            url: "https://github.com/surfstudio/iOS-Utils.git",
            revision: "13.2.0"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            exact: "1.16.0"
        ),
        .package(
            url: "https://github.com/doordash-oss/swiftui-preview-snapshots",
            exact: "1.1.1"
        )
    ],
    targets: [
        .target(
            name: "Library",
            dependencies: [
                "Resources",
                .product(name: "Utils",
                         package: "iOS-Utils"),
                // Позволяет подготовить превью к использованию в тестах
                .product(name: "PreviewSnapshots",
                         package: "swiftui-preview-snapshots")
            ],
            swiftSettings: [.define("MOCKING", .when(configuration: .debug))]),
        .target(
            name: "LibraryTestSupport",
            dependencies: [
                // Ядро snapshot-тестов
                .product(name: "SnapshotTesting",
                         package: "swift-snapshot-testing"),
                // Дополнительные проверки для заготовленных превью
                .product(name: "PreviewSnapshotsTesting",
                         package: "swiftui-preview-snapshots")
            ]
        ),
        .testTarget(
            name: "LibraryTests",
            dependencies: [
                "Library",
                "LibraryTestSupport",
                .product(name: "CoreTestSupport",
                         package: "Core")
            ])
    ]
)
