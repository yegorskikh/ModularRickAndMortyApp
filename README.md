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

![Simulator Screenshot - iPhone SE (3rd generation) - 2025-06-16 at 11 30 43](https://github.com/user-attachments/assets/7acdf187-fc0f-4215-b569-7446bed18ad7) ![Simulator Screenshot - iPhone SE (3rd generation) - 2025-06-16 at 11 16 17](https://github.com/user-attachments/assets/457b5f34-3e6f-441a-87b8-8cd8fc37a96b)





