// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Driver",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "Driver", type: .dynamic, targets: ["Driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "main"),
    ],
    targets: [
        .target(
            name: "Driver",
            dependencies: ["SwiftGodot"]
        ),
        .testTarget(
            name: "DriverTests",
            dependencies: ["Driver"]
        ),
    ]
)
