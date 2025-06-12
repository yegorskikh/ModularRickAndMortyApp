import SwiftUI
import Domain

public struct CharacterRow: View {
    let character: Character
    let isFav: Bool
    let toggle: () -> Void
    public init(character: Character, isFav: Bool, toggle: @escaping () -> Void) {
        self.character = character
        self.isFav = isFav
        self.toggle = toggle
    }
    public var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: character.image) { phase in
                switch phase {
                case .success(let image): image.resizable()
                default: Color.secondary.opacity(0.2)
                }
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(character.name).font(.headline)
                Text(character.status).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer()
            Button(action: toggle) {
                Image(systemName: isFav ? "star.fill" : "star")
            }.buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
}
