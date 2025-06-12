import SwiftUI

public struct OnboardingFlow: View {
    let onFinish: () -> Void
    @State private var page = 0
    public init(onFinish: @escaping () -> Void) { self.onFinish = onFinish }
    public var body: some View {
        VStack {
            TabView(selection: $page) {
                OnboardingScreen(title: "Добро пожаловать",
                                 text: "Это демо‑приложение показывает персонажей вселенной Rick & Morty.")
                    .tag(0)
                OnboardingScreen(title: "Избранное",
                                 text: "Добавляйте любимых героев в избранное и смотрите их отдельно.")
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            Button(page == 1 ? "Начать" : "Далее") {
                if page == 1 { onFinish() } else { withAnimation { page = 1 } }
            }
            .buttonStyle(.borderedProminent).padding()
        }
    }
}

private struct OnboardingScreen: View {
    let title: String; let text: String
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "sparkles").font(.system(size: 64))
            Text(title).font(.largeTitle).bold()
            Text(text).multilineTextAlignment(.center)
        }.padding()
    }
}
