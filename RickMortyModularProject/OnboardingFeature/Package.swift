// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "OnboardingFeature",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "OnboardingFeature", targets: ["OnboardingFeature"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "OnboardingFeature", dependencies: [])
    ]
)