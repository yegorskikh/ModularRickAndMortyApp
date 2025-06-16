# Modular

![Simulato](https://github.com/user-attachments/assets/62927f66-5362-447c-b27e-17033e337a1c)

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
