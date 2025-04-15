// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "GameCatalogAbout",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GameCatalogAbout",
            targets: ["GameCatalogAbout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GameCatalogAbout",
            dependencies: []),
        .testTarget(
            name: "GameCatalogAboutTests",
            dependencies: ["GameCatalogAbout"]),
    ]
)
