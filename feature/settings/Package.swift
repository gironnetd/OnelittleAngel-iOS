// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "settings",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "settings",
            targets: ["settings"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "common", path: "../../core/common"),
        .package(name: "designsystem", path: "../../core/designsystem"),
        .package(name: "ui", path: "../../core/ui"),
        .package(name: "testing", path: "../testing"),
        .package(name: "util", path: "../util")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "settings",
            dependencies: [
                "common",
                "designsystem",
                "ui"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "settingsTests",
            dependencies: [
                "settings",
                "testing",
                "util"
            ])
    ]
)
