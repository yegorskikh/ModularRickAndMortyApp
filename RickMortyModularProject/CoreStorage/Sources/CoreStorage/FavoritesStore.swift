import Foundation
import Combine

public final class FavoritesStore: ObservableObject {
    private let key = "favoriteCharacterIDs"
    private var cache: Set<Int>
    public init(userDefaults: UserDefaults = .standard) {
        let raw = userDefaults.array(forKey: key) as? [Int] ?? []
        cache = Set(raw)
    }
    public func isFavorite(id: Int) -> Bool { cache.contains(id) }
    public func toggle(id: Int) {
        if !cache.insert(id).inserted { cache.remove(id) }
        UserDefaults.standard.set(Array(cache), forKey: key)
        objectWillChange.send()
    }
}
