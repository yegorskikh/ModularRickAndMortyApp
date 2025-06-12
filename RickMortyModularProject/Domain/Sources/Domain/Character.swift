import Foundation

public struct CharacterPage: Decodable {
    public struct Info: Decodable { public let next: String? }
    public let info: Info
    public let results: [Character]
    public init(info: Info, results: [Character]) {
        self.info = info
        self.results = results
    }
}

public struct Character: Identifiable, Decodable, Equatable {
    public let id: Int
    public let name: String
    public let status: String
    public let image: URL
    public init(id: Int, name: String, status: String, image: URL) {
        self.id = id
        self.name = name
        self.status = status
        self.image = image
    }
}
