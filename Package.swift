// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SFSymbolEnum",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6)
  ],
  products: [
    .library(
      name: "SFSymbolEnum",
      targets: ["SFSymbolEnum"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SFSymbolEnum",
      dependencies: []),
    .testTarget(
      name: "SFSymbolEnumTests",
      dependencies: ["SFSymbolEnum"]),
  ]
)
