// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Scripts",
    platforms: [
      .macOS(.v12),
    ],
    dependencies: [],
    targets: [
      .executableTarget(
        name: "generate",
        dependencies: []),
    ]
)
