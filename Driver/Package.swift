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
        .package(
            url: "https://github.com/migueldeicaza/SwiftGodot",
            revision: "92e145300b5f2f71d989fb045fe7312e1dd9ff71"
        ),
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
