// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CoreStorage",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CoreStorage", targets: ["CoreStorage"])
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(name: "CoreStorage", dependencies: [.product(name: "Domain", package: "Domain")])
    ]
)