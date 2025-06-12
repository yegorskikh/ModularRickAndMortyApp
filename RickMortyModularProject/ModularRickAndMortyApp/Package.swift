// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ModularRickAndMortyApp",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ModularRickAndMortyApp", targets: ["ModularRickAndMortyApp"])
    ],
    dependencies: [
        .package(path: "../CoreDI"),
        .package(path: "../CharactersFeature"),
        .package(path: "../OnboardingFeature"),
    ],
    targets: [
        .target(name: "ModularRickAndMortyApp", dependencies: [.product(name: "CoreDI", package: "CoreDI"),
                .product(name: "CharactersFeature", package: "CharactersFeature"),
                .product(name: "OnboardingFeature", package: "OnboardingFeature")])
    ]
)