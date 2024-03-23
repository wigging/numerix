// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Numerix",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "Numerix", targets: ["Numerix"])
    ],
    targets: [
        .target(name: "Numerix"),
        .testTarget(name: "Tests", dependencies: ["Numerix"])
    ]
)
