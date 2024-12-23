// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
        .library(
            name: "CoreTestSupport",
            targets: ["CoreTestSupport"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/surfstudio/Surf-SwiftObfuscator",
            revision: "1.0.1"
        ),
        .package(
            url: "https://github.com/Kolos65/Mockable",
            revision: "0.0.5"
        ),
        .package(
            url: "https://github.com/surfstudio/SwiftMacros",
            revision: "0.0.3"
        ),
        .package(
            url: "https://github.com/pointfreeco/combine-schedulers",
            revision: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Obfuscator",
                         package: "Surf-SwiftObfuscator"),
                .product(name: "Mockable",
                         package: "Mockable"),
                .product(name: "SurfMacros",
                         package: "SwiftMacros"),
                .product(name: "SurfCore",
                         package: "SwiftMacros"),
                .product(name: "CombineSchedulers",
                         package: "combine-schedulers")
            ]
        ),
        .target(
            name: "CoreTestSupport",
            dependencies: [
                .product(name: "MockableTest",
                         package: "Mockable"),
                "Core"
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"])
    ]
)
