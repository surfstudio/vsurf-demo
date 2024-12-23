import SwiftUI

struct TutorView: View {

    @Binding var navigationState: TutorNavigationState

    private var item: SomeEntity

    // MARK: - Initialization

    init(item: SecureItemEntity, navigationState: Binding<MainNavigationState>) {
        self.item = item
        self._navigationState = navigationState
    }

    var body: some View {
        VStack {
            Text("Детали: \(item.title)")
            Button("Показать финал") {
                navigationState.push(destination: .final)
            }
            Button("Вернуться") {
                navigationState.popToRoot()
            }
        }
        .navigationTitle("Детальный экран")
    }
}
