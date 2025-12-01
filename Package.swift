// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "XcodeDocsMCP",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "xcode-docs-mcp", targets: ["XcodeDocsMCP"])
    ],
    targets: [
        .executableTarget(
            name: "XcodeDocsMCP",
            path: "Sources"
        )
    ]
)
