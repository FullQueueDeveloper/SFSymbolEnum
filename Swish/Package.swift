// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "SFSymbolEnum-Scripts",
    platforms: [
      .macOS(.v12),
    ],
    dependencies: [
      
    ],
    targets: [
      .executableTarget(
        name: "generate",
        dependencies: []),
    ]
)
