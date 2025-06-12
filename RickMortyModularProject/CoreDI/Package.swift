// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CoreDI",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CoreDI", targets: ["CoreDI"])
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../CoreNetworking"),
        .package(path: "../CoreStorage"),
    ],
    targets: [
        .target(name: "CoreDI", dependencies: [.product(name: "Domain", package: "Domain"),
                .product(name: "CoreNetworking", package: "CoreNetworking"),
                .product(name: "CoreStorage", package: "CoreStorage")])
    ]
)