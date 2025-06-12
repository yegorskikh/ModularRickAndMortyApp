import Foundation
import Combine
import Domain
import CoreNetworking
import CoreStorage

public protocol CharactersService {
    func fetchPage(_ page: Int) async throws -> CharacterPage
}

public final class CharactersRemoteService: CharactersService {
    public init() {}
    public func fetchPage(_ page: Int) async throws -> CharacterPage {
        try await APIClient.shared.fetch(url: CharactersEndpoint.page(page))
    }
}

public final class DIContainer: ObservableObject {
    public static let shared = DIContainer()
    private init() { register() }
    private var storage: [String: Any] = [:]
    private func register() {
        storage[String(describing: FavoritesStore.self)] = FavoritesStore()
        storage[String(describing: CharactersService.self)] = CharactersRemoteService() as CharactersService
    }
    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let dep = storage[key] as? T else {
            fatalError("Dependency \(key) not registered")
        }
        return dep
    }
}

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T
    public init() { wrappedValue = DIContainer.shared.resolve() }
}
