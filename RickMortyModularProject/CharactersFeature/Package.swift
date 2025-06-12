// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CharactersFeature",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CharactersFeature", targets: ["CharactersFeature"])
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../CoreDI"),
        .package(path: "../CoreStorage"),
    ],
    targets: [
        .target(name: "CharactersFeature", dependencies: [.product(name: "Domain", package: "Domain"),
                .product(name: "CoreDI", package: "CoreDI"),
                .product(name: "CoreStorage", package: "CoreStorage")])
    ]
)