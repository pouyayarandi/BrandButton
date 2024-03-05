// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BrandButton",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BrandButton",
            targets: ["BrandButton"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: .init(1, 15, 3))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BrandButton"),
        .testTarget(
            name: "BrandButtonTests",
            dependencies: [
                "BrandButton",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]),
    ]
)
