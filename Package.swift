// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "XcodeDocsMCP",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "xcode-docs-mcp", targets: ["XcodeDocsMCP"]),
        .library(name: "XcodeDocsMCPCore", targets: ["XcodeDocsMCPCore"])
    ],
    targets: [
        .target(
            name: "XcodeDocsMCPCore",
            path: "Sources/Core"
        ),
        .executableTarget(
            name: "XcodeDocsMCP",
            dependencies: ["XcodeDocsMCPCore"],
            path: "Sources/App"
        ),
        .testTarget(
            name: "XcodeDocsMCPTests",
            dependencies: ["XcodeDocsMCPCore"],
            path: "Tests"
        )
    ]
)
