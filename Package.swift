// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Numerix",
    platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17), .watchOS(.v10), .visionOS(.v1)],
    products: [
        .library(name: "Numerix", targets: ["Numerix"])
    ],
    targets: [
        .target(
            name: "Numerix",
            dependencies: ["RandomModule", "VectorModule", "MatrixModule", "ShapedArrayModule"],
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .target(
            name: "RandomModule",
            dependencies: ["VectorModule"]
        ),
        .target(
            name: "VectorModule",
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .target(
            name: "MatrixModule",
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .target(
            name: "ShapedArrayModule",
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .testTarget(name: "Tests", dependencies: ["Numerix"])
    ]
)
