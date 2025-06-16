import SwiftUI

public struct CharactersListView: View {
    let showOnlyFavorites: Bool
    @StateObject
    private var vm: CharactersListViewModel

    public init(showOnlyFavorites: Bool) {
        self.showOnlyFavorites = showOnlyFavorites
        _vm = StateObject(
            wrappedValue: CharactersListViewModel(showOnlyFavorites: showOnlyFavorites)
        )
    }

    public var body: some View {
        NavigationStack {
            List(vm.characters, id: \.id) { character in
                CharacterRow(character: character, isFav: vm.isFavorite(character.id)) {
                    vm.toggleFavorite(character.id)
                }
                .task { vm.loadMoreIfNeeded(currentItem: character) }
            }
            .navigationTitle(showOnlyFavorites ? "Favorites" : "Characters")
            .overlay {
                switch vm.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ContentUnavailableView(
                        "Error",
                        systemImage: "exclamationmark.triangle",
                        description: Text(error.localizedDescription)
                    )
                default:
                    EmptyView()
                }
            }
            .refreshable {
                vm.refresh()
            }
        }
        .onAppear {
            if vm.characters.isEmpty {
                vm.refresh()
            }
        }
    }
}
