import Foundation
import Combine
import Domain
import CoreDI
import CoreStorage

@MainActor
public final class CharactersListViewModel: ObservableObject {
    public enum State { case idle, loading, loadedAll, failed(Error) }
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var state: State = .idle

    @Inject private var service: CharactersService
    @Inject private var favorites: FavoritesStore

    private var nextPage = 1
    private var loadingTask: Task<Void, Never>?
    private let showOnlyFavorites: Bool

    public init(showOnlyFavorites: Bool) {
        self.showOnlyFavorites = showOnlyFavorites
    }

    public func refresh() {
        characters.removeAll()
        nextPage = 1
        state = .idle
        loadMoreIfNeeded(currentItem: nil)
    }

    public func loadMoreIfNeeded(currentItem item: Character?) {
        guard
            state != .loading && state != .loadedAll
        else {
            return
        }
        
        if item == nil || characters.last == item {
            loadingTask?.cancel()
            loadingTask = Task { await loadPage() }
        }
    }

    public func toggleFavorite(_ id: Int) {
        favorites.toggle(id: id)
        objectWillChange.send()
    }

    public func isFavorite(_ id: Int) -> Bool {
        favorites.isFavorite(id: id)
    }

    private func loadPage() async {
        guard state != .loading else { return }

        state = .loading
        do {
            let page = try await service.fetchPage(nextPage)
            nextPage += 1
            
            let newItems = showOnlyFavorites
                ? page.results.filter { favorites.isFavorite(id: $0.id) }
                : page.results
            
            characters.append(contentsOf: newItems)
            
            let reachedEnd = page.info.next == nil
            state = reachedEnd ? .loadedAll : .idle
            

            if showOnlyFavorites,
               !reachedEnd,
               characters.count < 15 { // примерно 1 экран
                await loadPage()
            }
        } catch {
            state = .failed(error)
        }
    }
}

extension CharactersListViewModel.State: Equatable {
    public static func == (lhs: CharactersListViewModel.State,
                           rhs: CharactersListViewModel.State) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.loadedAll, .loadedAll):
            return true
        case (.failed, .failed):
            return true   // считаем любые ошибки равными
        default:
            return false
        }
    }
}
