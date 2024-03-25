// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Numerix",
    platforms: [
        .macOS("13.3")
    ],
    products: [
        .library(name: "Numerix", targets: ["Numerix"])
    ],
    targets: [
        .target(
            name: "Numerix",
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .testTarget(name: "Tests", dependencies: ["Numerix"])
    ]
)
