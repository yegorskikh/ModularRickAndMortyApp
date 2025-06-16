# Modular

An example of the use of modules in xcode

```
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
        .target(
            name: "ModularRickAndMortyApp",
            dependencies: [
                .product(name: "CoreDI", package: "CoreDI"),
                .product(name: "CharactersFeature", package: "CharactersFeature"),
                .product(name: "OnboardingFeature", package: "OnboardingFeature")
                ]
        )
    ]
)
```

> Example screen
![Simulator Screenshot - iPhone SE (3rd generation) - 2025-06-16 at 11 16 17](https://github.com/user-attachments/assets/f16508cb-ddca-45c4-8258-d7436ba71aea)
