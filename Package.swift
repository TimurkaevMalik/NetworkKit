// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let kitName = "NetworkKit"

let package = Package(
    name: kitName,
    platforms: [.iOS(.v13)],
    products: [.library(name: kitName, type: .dynamic, targets: [kitName])],
    targets: [.target(name: kitName)]
)
