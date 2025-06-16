import SwiftUI
import CoreDI
import CharactersFeature
import OnboardingFeature

public struct ModularRickAndMortyAppEntry: View {
    @StateObject
    private var container = DIContainer.shared
    @AppStorage("hasSeenOnboarding")
    private var hasSeen = false
    
    public init() {}
    
    public var body: some View {
        if hasSeen {
            TabView {
                CharactersListView(showOnlyFavorites: false)
                    .tabItem { Label("All", systemImage: "list.bullet") }
                CharactersListView(showOnlyFavorites: true)
                    .tabItem { Label("Favorites", systemImage: "star.fill") }
            }
            .environmentObject(container)
        } else {
            OnboardingFlow { hasSeen = true }
                .environmentObject(container)
        }
    }
}
