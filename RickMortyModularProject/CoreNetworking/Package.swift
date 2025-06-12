// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CoreNetworking",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CoreNetworking", targets: ["CoreNetworking"])
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(name: "CoreNetworking", dependencies: [.product(name: "Domain", package: "Domain")])
    ]
)