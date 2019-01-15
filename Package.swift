// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KrakenKit",
    products: [
        .library(name: "Proto", type: .static, targets: ["Proto"]),
        .library(name: "KrakenKit", type: .static, targets: ["KrakenKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "Proto",
            dependencies: ["SwiftProtobuf"]),
        .target(
            name: "KrakenKit",
            dependencies: ["Proto"]),
        .testTarget(
            name: "KrakenKitTests",
            dependencies: ["KrakenKit"]),
    ]
)
