import SwiftUI

public struct TutorViewGroup: View {

    @State private var navigationState: TutorNavigationState = .initial

    public var body: some View {
        NavigationStack(path: $navigationState.navigationPath) {
            HStack {
                Button("Единственный элемент") {
                    navigationState.push(destination:
                            .itemDetail(.init(id: "1",
                                              title: "")))
                }
            }
            .navigationTitle("Заглушка")
            .navigationDestination(for: MainNavigationState.Destination.self) { destination in
                switch destination {
                case .itemDetail(let item):
                    TutorView(item: item, navigationState: $navigationState)
                default:
                    EmptyView()
                }
            }
        }
    }
}
