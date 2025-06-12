import Foundation
public enum CharactersEndpoint {
    public static func page(_ index: Int) -> URL {
        URL(string: "https://rickandmortyapi.com/api/character?page=\(index)")!
    }
}
